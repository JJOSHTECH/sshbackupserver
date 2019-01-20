# Use a Debian Image
FROM debian:latest

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install rsync and opsenssh
RUN apt install openssh-server -y

# Start and restart ssh Server for initial Setup
RUN service ssh start
RUN service ssh stop

# Create Volume for Certs
VOLUME ["/root/.ssh/"]
# Create Volume for Configuration and Host Certs
VOLUME ["/etc/ssh/"]
# Create Volume for Backup Folder
VOLUME ["/var/backup/"]

# Copy sshd config to Image
COPY ./conf/sshd_config /etc/ssh/sshd_config

# Start SSH Server in Debug mode
CMD ["/usr/sbin/sshd","-p","22","-D","-e"]

# Expose ssh Port
EXPOSE 22
