#!/bin/sh
for SERVICE in `find /etc/systemd /lib/systemd -type f -name *.service`; do
	sudo sed -i '/ExecStartPost=\/usr\/local\/bin\/startup-log.*/d' $SERVICE
done
