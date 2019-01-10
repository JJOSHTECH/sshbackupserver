#!/bin/bash

if [ "$TYPE" = "client" ] || [ "$TYPE" == "both" ]
then
	echo '0 * * * * rsync -aze "ssh -p 22" root@$SERVER_ADDRESS:/var/backup/ /var/backup' >> cronjobs
	crontab cronjobs
	rm cronjobs
	/usr/sbin/cron -f
fi

if [ "$TYPE" == "server" ] || [ "$TYPE" == "both" ]
then
	/usr/sbin/sshd -p 22 -D -e
fi
