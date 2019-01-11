# Use a Debian Image
FROM arm32v7/debian:latest

#ARM Support
COPY qemu-arm-static /usr/bin

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
ENV PORT="22"

# copy startUp script into container
COPY ./startUP.sh ./startUP.sh

# add run permissions to startUP script
RUN chmod +x ./startUP.sh

# Start SSH Server in Debug mode
CMD ["./startUP.sh"]

# Expose ssh Port
EXPOSE 22
