#!/bin/bash

OLD_NAME="cpp-container"

echo "Enter a unique docker container name: "
read NEW_NAME

sed -i "s/CONTAINER_NAME=$OLD_NAME/CONTAINER_NAME=$NEW_NAME/g" "docker.sh"
sed -i "s/container_name: $OLD_NAME/container_name: $NEW_NAME/g" "../docker-compose.yml"

echo "Docker container name has changed to '$NEW_NAME'"

# Delete this script file
# rm -- "$0"
