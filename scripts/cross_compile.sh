#!/bin/bash

# Set the target architecture
TARGET="arm-unknown-linux-gnueabihf"

# Build the project using cross for the specified target
echo "Building the project for target: $TARGET"
cross build --release --target=$TARGET

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
else
    echo "Build failed!"
    exit 1
fi
