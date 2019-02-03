# JJOSHTECH/sshbackupserver
With this Container its possible to implement an automated backup solution for your file system.

## Related Containers
This ist the Server Docker Container for JJOSHTECH/sshbackupclient

## Tags
There are two tags, both are always the latest Version of the image: - latest - armhf

### latest
Latest is build for AMD and Intel Architecture Hosts.

### armhf
armhf is build for ARM Architcture Hosts.

## Volumes
To Connect to the Client you have to define two Volumes: - /root/.ssh/ - /etc/ssh
To store your Files you want to Backup define the Volume: - /var/backup/

## Connecting to Client
To make possible that clients establish a connection you need to create certificates for your servert or copy the certs you made for the client into /etc/ssh/. And add the public Key into authorized_keyz and known_hosts file in /root/.ssh/ . The Server needs the client public key in the authorized_keyz file and the client needs the server pubkey there. After that it should run.