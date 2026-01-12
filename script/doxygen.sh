#!/bin/bash

DOCKERFILE_PATH=docker/Dockerfile.docs
CONTAINER_NAME=container_doxygen
IMAGE_NAME=doxygen

print_help() {
	cat <<EOF
Usage: $0 [OPTIONS]

Run and Manage Docker

Options:
	-h, --help    			  Show this help message and exit
	"", --docs						Create container and image to generate documentation
	-c, --clean						Purge docker container
	-i, --image-clean			Purge docker image

EOF
}

generate_doc() {
	docker build -t $IMAGE_NAME -f $DOCKERFILE_PATH .
	docker run --name $CONTAINER_NAME --rm $IMAGE_NAME
}

CURR_FILE_PATH="$0"
CURR_DIR_PATH="${CURR_FILE_PATH%/*}"
cd $CURR_DIR_PATH
cd ../

if [[ $# -eq 0 ]]; then
	echo "Generating documentation..."
	generate_doc
	exit
fi

while test $# -gt 0; do
	case "$1" in
		--docs)
			shift

			if test $# -gt 0; then
				echo "--docs cannot have more than one flag after it"
				exit 1
      fi

			echo "Generating documentation..."
			generate_doc
			exit
			;;

		-c|--clean)
			shift

			echo "Cleaning container..."

			docker stop $CONTAINER_NAME
			docker rm $CONTAINER_NAME
			;;
			
		-i|--image-clean)
			shift

			echo "Cleaning image..."

			docker rmi $IMAGE_NAME
			;;

		-h|--help)
			shift
			print_help
			exit 1
			;;

		*)
			echo "Unknown option: $1" >&2
			echo "Use --help for usage."
			exit 1
			;;
	esac
done
