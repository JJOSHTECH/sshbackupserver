# sshbackupserver
Automated backup solution.

This is a Container, that can be used to do Automated Backups on different Clients.

There is a Server that runs a SSH-Server and is Listening on Port 22 and there is a client that connects to this Server via Cronjob. In this cronjob it it downloads the whole /var/backup/ folder via rsync.

More Description coming soon.
