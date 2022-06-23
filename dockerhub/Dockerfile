FROM debian:stable

# Installing requirements
# Wget to get the binary, libicu-dev as a requirement for the server
RUN apt update
RUN apt install wget libicu-dev -y

WORKDIR /root
COPY init.sh /root/
RUN bash /root/init.sh
CMD ["/bin/bash", "-l", "-c", "/root/Server"]
