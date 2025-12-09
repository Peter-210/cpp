#!/bin/bash

OLD_NAME="cpp-container"

read -p "Enter new container name: " NEW_NAME
echo

echo "This will change project files to use '$NEW_NAME' as the new container name"
read -p "Are you sure? (Press 'y' to proceed) " -n 1 -r USER_REPLY
echo

if [[ ! $USER_REPLY =~ ^[Yy]$ ]]
then
	echo "Terminated action to change container name"
	exit 1
fi

sed -i "s/CONTAINER_NAME=$OLD_NAME/CONTAINER_NAME=$NEW_NAME/g" "docker.sh"
sed -i "s/container_name: $OLD_NAME/container_name: $NEW_NAME/g" "../docker-compose.yml"

echo "Docker container name has changed to '$NEW_NAME'"

# Delete this script file
rm -- "$0"
