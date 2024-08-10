#!/bin/bash

# Set the target server details
SERVER_USER="paulek"
SERVER_PASSWORD="admin1234"
SERVER_IP="pi-zero.local"
TARGET_DIR="/home/paulek"
BINARY_NAME="pizerow-test"

# Define the path to the binary on the target server
BINARY_PATH="$TARGET_DIR/$BINARY_NAME"

# Function to run the binary on the target server
run_binary() {
    echo "Running binary on server: $SERVER_USER@$SERVER_IP"
    sshpass -p $SERVER_PASSWORD ssh $SERVER_USER@$SERVER_IP "nohup $BINARY_PATH &"

    # Check if the execution was successful
    if [ $? -eq 0 ]; then
        echo "Binary execution started successfully!"
    else
        echo "Binary execution failed!"
        exit 1
    fi
}

# Function to stop the binary process on the target server
stop_binary() {
    echo "Stopping binary on server: $SERVER_USER@$SERVER_IP"
    sshpass -p $SERVER_PASSWORD ssh $SERVER_USER@$SERVER_IP "pkill -f $BINARY_NAME"

    # Check if the process was killed successfully
    if [ $? -eq 0 ]; then
        echo "Binary process stopped successfully!"
    else
        echo "Failed to stop the binary process!"
        exit 1
    fi
}

# Function to stop the binary process running in the terminal
stop_local_binary() {
    echo "Stopping local binary process"
    pkill -f $BINARY_NAME

    # Check if the process was killed successfully
    if [ $? -eq 0 ]; then
        echo "Local binary process stopped successfully!"
    else
        echo "Failed to stop the local binary process!"
        exit 1
    fi
}

# Check for the stop option
if [ "$1" = "stop" ]; then
    stop_binary
elif [ "$1" = "stop_local" ]; then
    stop_local_binary
else
    run_binary
fi
