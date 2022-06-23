#!/bin/bash

# Run docker to build for multiplatform, build on WSL2 subsystem.
docker buildx build . --platform linux/arm,linux/arm64,linux/amd64 --tag dasteen25/smo_online_server:latest --push