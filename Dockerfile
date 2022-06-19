FROM debian:stable

# Installing requirements
# Wget to get the binary, libicu-dev as a requirement for the server
RUN apt update
RUN apt install wget libicu-dev -y

# Workdir to place the binary, wget to download the latest server. and to make it executable
WORKDIR /root
RUN wget https://github.com/Sanae6/SmoOnlineServer/releases/latest/download/Server
RUN chmod +x Server

# '*' for if file exists. May also not be required.
COPY *settings.json /root

# Run the server
CMD ["/bin/bash", "-l", "-c", "/root/Server"]

