arch=$(uname -i)
if [[ $arch == x86_64* ]]; then
    file = "Server"
elif  [[ $arch == arm* ]]; then
    file "ARM-Server"
fi

wget https://github.com/Sanae6/SmoOnlineServer/releases/latest/download/$file -o Server