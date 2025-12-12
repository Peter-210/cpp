#!/bin/bash

echo "This script will setup the project and use your new public.env variables"
read -p "Have you updated public.env? (Press 'y' to proceed) " -n 1 -r USER_REPLY
echo

if [[ ! $USER_REPLY =~ ^[Yy]$ ]]
then
	echo "Terminated Action: Please update public.env before running this script"
	exit 1
fi

# cd to project directory
CURR_FILE_PATH="$0"
CURR_DIR_PATH="${CURR_FILE_PATH%/*}"
cd $CURR_DIR_PATH
cd ../

# Load setup variables
source public.env

# Change file variables to match setup variables
sed -i "s/\(container_name: \).*/\1$CONTAINER_NAME/g" "docker-compose.yml"
sed -i "s/\(CONTAINER_NAME=\).*/\1$CONTAINER_NAME/g" "script/docker.sh"

sed -i "2s/.*/  ${IMAGE_NAME}:/" "docker-compose.yml"
sed -i "s/extends:.*/extends: ${IMAGE_NAME}/" "docker-compose.yml"
sed -i "s/\(IMAGE_PROD_NAME=\).*/\1${IMAGE_NAME}-prod/g" "script/docker.sh"
sed -i "s/\(IMAGE_DEV_NAME=\).*/\1${IMAGE_NAME}-dev/g" "script/docker.sh"

# sed -i "s/\(IMAGE_PROD_NAME=\).*/\1$IMAGE_PROD_NAME/g" "script/docker.sh"
# sed -i "/cpp-prod:/,/image:/s|image:.*|image: $IMAGE_PROD_NAME|" "docker-compose.yml"

# sed -i "s/\(IMAGE_DEV_NAME=\).*/\1$IMAGE_DEV_NAME/g" "script/docker.sh"
# sed -i "/cpp-dev:/,/image:/s|image:.*|image: $IMAGE_DEV_NAME|" "docker-compose.yml"

echo "Setup complete"
