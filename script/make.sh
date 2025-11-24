#!/bin/bash


print_help() {
	cat <<EOF
Usage: $0 [OPTIONS]

Run and Manage CMake Build

Options:
	-h, --help    			  Show this help message and exit
	-d, --debug						Build project to run in debug mode
	-c, --clean						Remove build files
	-cl, --clean-lib			Remove lib files (eg. googletest)

EOF
}


case "$1" in
	""|-d|--debug)
		echo "Running cmake --workflow --preset debug"
		cmake --workflow --preset debug
		;;

	-c|--clean)
		if [ -d "./build/" ]; then
			echo "Removing ./build/ folder"
			rm -rf ./build/
		fi
		if [ -L "./compile_commands.json" ]; then
			echo "Removing ./compile_commands.json file"
			rm ./compile_commands.json
		fi
		;;

	-cl|--clean-lib)
		if [ -d "./lib/" ]; then
			echo "Removing ./lib/ folder"
			rm -rf ./lib/
		fi
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
