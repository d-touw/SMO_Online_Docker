# SMO_Online_Docker
This is an easy setup to host a SMO Online server in a docker container for Linux environments, including WSL2.
The SMO Online mod can be found [here](https://github.com/CraftyBoss/SuperMarioOdysseyOnline).
The SMO Online server can be found [here](https://github.com/Sanae6/SmoOnlineServer).

## Some info
To keep the server configurable I opted to use docker-compose. This way you can edit `settings.json` in `container-files` and reload the config if you want too within the server, it also makes lets you keep your settings as the coutainer-files directory is mounted in the container.

If you wish to edit to port, make sure you change the port in `settings.json` in `container-files` but also in `docker-compose.yml`, as that is the file which specifies which ports to open.

There is also a dockerhub [image](https://hub.docker.com/repository/docker/dasteen25/smo_online_server) available, it will work on ARM, ARM64 and AMD64, did build it for multiple platforms. Pull it with:

` $ docker pull dasteen25/smo_online_server`

Note: This image is not automatically updated when a new build of the SMO server binaries is released.


## Requirements
Make sure you have docker, docker.io and docker-compose installed, ie:

`$ sudo apt install docker docker.io docker-compose -y`

Or your distro's equivalent.

Also add your user to the docker group to run it without sudo:

`$ sudo usermod -aG docker $USER`

And relog your console/ssh session to get the group permission.


## Running the environment
Clone the repo and cd into the directory.
To start, run start.sh, `$ bash start.sh`. This will download the appropriate file for your environment, either AMD64 or ARM/ARM64.

To run the server use the following command:
`$ docker-compose up -d`

The container will be ran in the background and you will not get into the console with this command. This is intended to keep the server running. To get into the console of the server run the folllowing command:

`$ docker attach smo_online_docker_server_1`

The escape sequence for the container will be by default `ctrl+p+q`. But in some shells, powershell and linux ssh, there is another option:

`$ docker attach smo_online_docker_server_1 --sig-proxy=false`

Note that the option `--sig-proxy=false` is added, insted of pressing `ctrl+p+q` we can detach from the container by pressing `ctrl+c`.

If you want to shutdown the container run the following command:

` $ docker-compose down`

## To update the server?
Just run the `bash start.sh` command again, it will download the new config for the server.

## Contributors
As said in the intro go checkout [CraftyBoss](https://github.com/CraftyBoss/SuperMarioOdysseyOnline) and [Sanae](https://github.com/Sanae6/SmoOnlineServer) for their, and their group's awesome work on this mod!
