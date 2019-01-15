#!/bin/bash

if [ "$TYPE" == "both" ]
then
	/usr/sbin/cron -f &
	/usr/sbin/sshd -p 22 -D -e
fi

if [ "$TYPE" = "client" ]
then
	/usr/sbin/cron -f -L 7
fi

if [ "$TYPE" == "server" ]
then
	/usr/sbin/sshd -p 22 -D -e
fi
