#!/bin/sh -e

# handle files
file_conf=/etc/rsyslog.d/files.conf

for k in $LOGGLY_FILES; do
  logfile="${k}.log"

  echo "\$InputFileName /var/log/$logfile" >> $file_conf
  echo "\$InputFileTag ${k}" >> $file_conf
  echo "\$InputFileStateFile state-$logfile" >> $file_conf
  echo "\$InputFileFacility local6" >> $file_conf
  echo "\$InputRunFileMonitor" >> $file_conf
  echo >> $file_conf
done

# handle common tags
tags=''
for t in $LOGGLY_TAGS; do
  tags="$tags tag=\\\\\"${t}\\\\\""
done

token=none

if [ -n "${LOGGLY_TOKEN}" ]; then
  token=${LOGGLY_TOKEN}
elif [ -n "${LOGGLY_SERVICE_KEY}" ]; then
  token=${LOGGLY_SERVICE_KEY}
elif [ -n "${LOGGING_SERVICE_KEY}" ]; then
  token=${LOGGING_SERVICE_KEY}
fi


sed -i "s/LOGGLY_TOKEN/$LOGGLY_TOKEN/g" /etc/rsyslog.d/loggly.conf
sed -i "s/ LOGGLY_TAGS/$tags/g" /etc/rsyslog.d/loggly.conf

rsyslogd -n
