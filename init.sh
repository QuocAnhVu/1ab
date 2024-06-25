#! /bin/sh

podman run \
  --volume /home/quocanh/ws/1ab/ws:/home/user/ws:z \
  --gpus all \
  --ipc=host \
  --memory 32g \
  --publish 8888:8888 \
  --rm \
  --tty \
  --interactive \
  1ab:latest jupyter lab
