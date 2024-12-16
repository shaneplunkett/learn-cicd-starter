#!/bin/bash

# Detect the architecture of the host system
ARCH=$(uname -m)
GOARCH="amd64" # Default to amd64

if [ "$ARCH" == "arm64" ] || [ "$ARCH" == "aarch64" ]; then
  GOARCH="arm64"
fi

# Build the binary for Linux
echo "Building for GOOS=linux GOARCH=$GOARCH"
CGO_ENABLED=0 GOOS=linux GOARCH=$GOARCH go build -o notely
