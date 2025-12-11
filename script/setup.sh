#!/bin/bash

CURR_FILE_PATH="$0"
CURR_DIR_PATH="${CURR_FILE_PATH%/*}"

cd $CURR_DIR_PATH
sed -i "s/CONTAINER_NAME=$OLD_NAME/CONTAINER_NAME=$NEW_NAME/g" "docker.sh"
sed -i "s/container_name: $OLD_NAME/container_name: $NEW_NAME/g" "../docker-compose.yml"
