#!/bin/bash

# Ensure the cross_compile.sh script has executable permissions
chmod +x ./scripts/cross_compile.sh

# Invoke the cross_compile.sh script
./scripts/cross_compile.sh

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Build successful! Proceeding to send the binary to the server."
else
    echo "Build failed! Exiting."
    exit 1
fi

# Ensure the send_binary_to_server.sh script has executable permissions
chmod +x ./scripts/send_binary_to_server.sh

# Ensure the run_remote_binary.sh script has executable permissions
chmod +x ./scripts/run_remote_binary.sh

# Invoke the run_remote_binary.sh script
./scripts/run_remote_binary.sh stop

# Invoke the send_binary_to_server.sh script
./scripts/send_binary_to_server.sh

# Check if the transfer was successful
if [ $? -eq 0 ]; then
    echo "Binary transfer successful! Proceeding to run the binary on the server."
else
    echo "Binary transfer failed! Exiting."
    exit 1
fi

./scripts/run_remote_binary.sh

# Check if the execution was successful
if [ $? -eq 0 ]; then
    echo "Binary execution started successfully!"
else
    echo "Binary execution failed! Exiting."
    exit 1
fi