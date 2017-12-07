#!/bin/bash

set -e

function hasEc2Prefix() {
  local file=$1

  if [[ -f $file ]] && [[ `head -c 3 $file | awk '{print tolower($0)}'` == ec2 ]]; then
    echo "1"
  else
    echo "0"
  fi
}

if [[ `hasEc2Prefix /sys/hypervisor/uuid` == 1 ]] || [[ `hasEc2Prefix /sys/devices/virtual/dmi/id/product_uuid` == 1 ]]; then
  instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
  region=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | rev | cut -c 2- | rev)
  lifecycle=$(aws ec2 describe-instances --region $region --instance-ids $instance_id --query 'Reservations[0].Instances[0].InstanceLifecycle' --output text)
  private_ip=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

  if [ $lifecycle == 'None' ]; then
    lifecycle='normal'
  fi

  export EC2_INSTANCE_LIFECYCLE=$lifecycle
  export EC2_PRIVATE_IP=$private_ip
fi

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

	set -- gosu elasticsearch "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
