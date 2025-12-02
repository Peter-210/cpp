#!/bin/bash

CONTAINER_NAME=cpp-container

print_help() {
	cat <<EOF
Usage: $0 [OPTIONS]

Run and Manage Docker

Options:
	-h, --help    			  Show this help message and exit
	-d, --dev							Create container and image for developement (uses extra dev tools)
	-p, --prod						Create container and image for production (minimal dependencies)
	-c, --clean						Purge docker container and image

EOF
}

make_container() {
	docker-compose --profile "$1" up -d
	docker exec -it "$CONTAINER_NAME" /bin/bash
}

case "$1" in
	""|-d|-dev)
		echo "Starting docker in profile dev"
		make_container "dev"
		;;

	-p|-prod)
		echo "Starting docker in profile prod"
		make_container "prod"
		;;

	-c|-clean)
		echo "Cleaning container and image"
		docker stop $(docker ps -aq)
		docker rm $(docker ps -aq)
		docker rmi -f $(docker images -q)
		;;

	-h|--help)
		print_help
		;;

	*)
		echo "Unknown option: $1" >&2
		echo "Use --help for usage."
		exit 1
		;;
esac

exit 0
