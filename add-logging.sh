#!/bin/sh

for SERVICE in `find /etc/systemd -name *.service`; do
	if grep -q startup-log $SERVICE; then
		false
	else
		sudo sed -i "/\[Service\]/a \
ExecStartPost=/usr/local/bin/startup-log \"$SERVICE\"" $SERVICE
	fi
done
