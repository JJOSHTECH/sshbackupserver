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

# Enviroment to describe the Port the Server should listen to
ENV PORT="22"

# Start SSH Server in Debug mode
CMD ["/usr/sbin/sshd","-p","$PORT","-D","-e"]

# Expose ssh Port
EXPOSE 22
