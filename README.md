# SMO_Online_Docker
This is an easy setup to host a SMO Online server in a docker container for Linux environments.
The SMO Online mod can be found [here](https://github.com/CraftyBoss/SuperMarioOdysseyOnline).
The SMO Online server can be found [here](https://github.com/Sanae6/SmoOnlineServer).

## Requirements
Make sure you have docker.io and docker-compose installed.
Also add your user to the docker group to run it without sudo:

`$ sudo usermod -aG docker $USER`

And relog your console/ssh session to get the group permission.

## Some info
To keep the server configurable I opted to use docker-compose. This way you can edit `settings.json` in `container-files` and reload the config if you want too within the server, it also makes lets you keep your settings as the coutainer-files directory is mounted in the container.

## Running the environment
Clone the repo and cd into the directory.
To start, run start.sh, `$ bash start.sh`. This will download the appropriate file for your environment, either AMD64 or ARM/ARM64.

To run the server use the following command:
`$ docker-compose up -d`

The container will be ran in the background and you will not get into the console with this command. This is intended to keep the server running. To get into the console of the server run the folllowing command:

`$ docker attach smo_online_docker_server_1 --detach-keys ctrl-x`

Note that the option `--detach-keys` is added, this is to make sure we can escape the container without killing the server.

If you want to shutdown the container run the following command:

` $ docker-compose down`

## To update the server?
Just run the `bash start.sh` command again, it will download the new config for the server.