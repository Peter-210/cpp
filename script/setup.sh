#!/bin/bash

# cd to project directory
CURR_FILE_PATH="$0"
CURR_DIR_PATH="${CURR_FILE_PATH%/*}"
cd $CURR_DIR_PATH
cd ..

# Load setup variables
source public.env

# Change file variables to match setup variables
sed -i "s/^\(CONTAINER_NAME=\).*/\1$CONTAINER_NAME/g" "script/docker.sh"
sed -i "s/^\(container_name: \).*/\1$CONTAINER_NAME/g" "docker-compose.yml"

# sed -i "s/CONTAINER_NAME=$OLD_NAME/CONTAINER_NAME=$CONTAINER_NAME/g" "script/docker.sh"
# sed -i "s/container_name: $OLD_NAME/container_name: $CONTAINER_NAME/g" "docker-compose.yml"

echo "Setup complete"
