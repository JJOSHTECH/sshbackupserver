#!/bin/bash

if [ "$TYPE" == "both" ]
then
	echo '0 * * * * rsync -vaze "ssh -p $PORT" root@$SERVER_ADDRESS:/var/backup/ /var/backup' >> cronjobs
	crontab cronjobs
	rm cronjobs
	/usr/sbin/cron -f &
	/usr/sbin/sshd -p 22 -D -e
fi

if [ "$TYPE" = "client" ]
then
	echo '0 * * * * rsync -vaze "ssh -p $PORT" root@$SERVER_ADDRESS:/var/backup/ /var/backup' >> cronjobs
	crontab cronjobs
	rm cronjobs
	/usr/sbin/cron -f
fi

if [ "$TYPE" == "server" ]
then
	/usr/sbin/sshd -p 22 -D -e
fi
