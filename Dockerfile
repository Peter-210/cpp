# Use Ubuntu image as base image
# FROM ubuntu:latest
FROM ubuntu:noble-20251013

# Install required dependencies
RUN apt-get update && apt-get install -y \
	g++ \
	git \
	cmake

# (Optional) Install development dependencies
RUN apt-get install -y \
	gdb \
	valgrind \
	clang-tidy

# (Optional) Install perf for profiling
RUN apt-get install -y linux-tools-generic
RUN rm /usr/bin/perf
RUN ln -s /usr/lib/linux-tools/6.8.0-88-generic/perf /usr/bin/perf

# Set working directory in the container
WORKDIR /app
