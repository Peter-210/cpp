# Use Ubuntu image as base image
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && apt-get install -y \
	g++ \
	git \
	cmake

# (Optional) Install development dependencies
RUN apt-get update && apt-get install -y \
	gdb \
	valgrind \
	clang-tidy

# Set working directory in the container
WORKDIR /app
