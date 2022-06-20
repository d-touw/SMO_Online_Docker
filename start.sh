#!/bin/bash

arch=$(dpkg --print-architecture)
if [[ $arch == x86_64* ]]; then
    file="Server"
elif  [[ $arch == arm ]]; then
    file="Server.arm"
elif  [[ $arch == arm64 ]]; then
    file="Server.arm64"
fi

# Wget to download the correct file
wget https://github.com/Sanae6/SmoOnlineServer/releases/latest/download/$file -O Server
chmod +x Server

if [ -f container-files/Server ]
then
    rm container-files/Server
fi

mv Server container-files/Server
