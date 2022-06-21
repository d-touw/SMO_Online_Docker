#!/bin/bash

# Check for architecture, this only works on linux, not on mac.
arch=$(dpkg --print-architecture)
if [[ $arch == x86_64* || amd64 ]]; then
    file="Server"
elif  [[ $arch == armf ]]; then
    file="Server.arm"
elif  [[ $arch == arm64 ]]; then
    file="Server.arm64"
fi

# check for Sever file in 'root' dir and delete it for wget
if [ -f -./Server ]
then
    rm container-files/Server
fi

# Wget to download the correct file and to set permissions.
wget https://github.com/Sanae6/SmoOnlineServer/releases/latest/download/$file -O Server
chmod +x Server

# check if file exists in container-filed dir
if [ -f docker-compose/container-files/Server ]
then
    rm docker-compose/container-files/Server
fi

# check if file exists in container-filed dir
if [ -f dockerfile/Server ]
then
    rm dockerfile/Server
fi

#finally move the server file.
cp Server docker-compose/container-files/Server
mv Server dockerfile/Server
