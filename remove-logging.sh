#!/bin/sh
for SERVICE in `find /etc/systemd -name *.service`; do
	sudo sed -i '/ExecStartPost=\/usr\/local\/bin\/startup-log.*/d' $SERVICE
done
