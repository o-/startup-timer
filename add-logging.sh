#!/bin/sh

for SERVICE in `find /etc/systemd /lib/systemd -type f -name *.service`; do
	NAME=`basename $SERVICE`
	if grep -q startup-log $SERVICE; then
		false
	else
		echo "$NAME"
		sudo sed -i "/\[Service\]/a \
ExecStartPost=/usr/local/bin/startup-log \"$NAME\"" $SERVICE
	fi
done
