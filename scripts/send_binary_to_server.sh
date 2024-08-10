#!/bin/bash

# Set the target server details
SERVER_USER="paulek"
SERVER_PASSWORD="admin1234"
SERVER_IP="pi-zero.local"
TARGET_DIR="/home/paulek"

# Define the path to the binary
BINARY_PATH="target/arm-unknown-linux-gnueabihf/release/pizerow-test"

# Copy the binary to the target server
echo "Sending binary to server: $SERVER_USER@$SERVER_IP:$TARGET_DIR"
sshpass -p $SERVER_PASSWORD scp $BINARY_PATH $SERVER_USER@$SERVER_IP:$TARGET_DIR

# Check if the transfer was successful
if [ $? -eq 0 ]; then
    echo "Binary transfer successful!"
else
    echo "Verbose error message: $(sshpass -p $SERVER_PASSWORD scp $BINARY_PATH $SERVER_USER@$SERVER_IP:$TARGET_DIR 2>&1)"
    echo "Binary transfer failed!"
    exit 1
fi
