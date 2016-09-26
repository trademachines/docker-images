#!/bin/bash

set -e

if [[ -f /sys/hypervisor/uuid ]] && [[ `head -c 3 /sys/hypervisor/uuid` == ec2 ]]; then
  instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
  region=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | rev | cut -c 2- | rev)
  lifecycle=$(aws ec2 describe-instances --region $region --instance-ids $instance_id --query 'Reservations[0].Instances[0].InstanceLifecycle' --output text)

  if [ $lifecycle == 'None' ]; then
    lifecycle='normal'
  fi

  export EC2_INSTANCE_LIFECYCLE=$lifecycle
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
