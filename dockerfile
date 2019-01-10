# Use a Debian Image
FROM debian:latest

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install rsync and opsenssh
RUN apt install openssh-server rsync cron -y

# Start and restart ssh Server for initial Setup
RUN service ssh start
RUN service ssh stop

# Create Volume for Certs
VOLUME ["/root/.ssh/"]
# Create Volume for Configuration and Host Certs
VOLUME ["/etc/ssh/"]
# Create Volume for Backup Folder
VOLUME ["/var/backup/"]

# Enviroment variable for deciding the container type
# server = ssh server runs in foreground
# client = no ssh server & cron job to run rsync
# both = do both server & client
ENV TYPE="server"

# Enviroment to describe the server from which you want to make an update
ENV SERVER_ADDRESS="localhost"

# copy startUp script into container
COPY ./startUP.sh /root/startUP.sh

# add run permissions to startUP script
RUN chmod +x /root/startUP.sh

# Start SSH Server in Debug mode
CMD ["/root/startUP.sh"]

# Expose ssh Port
EXPOSE 22
