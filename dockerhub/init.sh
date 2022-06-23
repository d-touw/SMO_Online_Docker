#!/bin/bash

# Check for architecture, this only works on linux, not on MacOS.
arch=$(dpkg --print-architecture)
if [[ $arch == x86_64* || $arch == amd64 ]]; then
    file="Server"
elif  [[ $arch == armhf ]]; then
    file="Server.arm"
elif  [[ $arch == arm64 ]]; then
    file="Server.arm64"
fi

# wget to download the correct file and to set permissions.
wget https://github.com/Sanae6/SmoOnlineServer/releases/latest/download/$file -O /root/Server
chmod +x /root/Server