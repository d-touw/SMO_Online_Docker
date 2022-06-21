FROM debian:stable

# Installing requirements
# Wget to get the binary, libicu-dev as a requirement for the server
RUN apt update
RUN apt install wget libicu-dev -y