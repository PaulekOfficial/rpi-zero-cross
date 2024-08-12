# Raspberry Pi Zero Cross Compilation with Rust

This project demonstrates how to set up a Rust development environment for cross-compiling applications targeting the Raspberry Pi Zero. It allows you to write and compile Rust code on a more powerful development machine and deploy it on the Raspberry Pi Zero, optimizing performance for its ARM architecture.

## Features

- **Cross-compilation**: Efficiently compile Rust code for ARM architecture.
- **Automated setup**: Scripts included for setting up the cross-compilation environment.
- **Rust toolchain**: Utilizes the Rust toolchain to ensure safety and performance.

## Prerequisites

- A development machine with Rust installed.
- A Raspberry Pi Zero with network access.
- Basic knowledge of Rust and cross-compilation.
- `rpi_tools` for the C++ linker:

    ```sh
    git clone https://github.com/raspberrypi/tools $HOME/rpi_tools
    ```

## Setup

1. Clone this repository:
    ```sh
    git clone https://github.com/PaulekOfficial/rpi-zero-cross.git
    cd rpi-zero-cross
    ```

2. Install the required Rust target:
    ```sh
    rustup target add arm-unknown-linux-gnueabihf
    ```

3. Run the build script:
    ```sh
    ./scripts/cross_compile.sh
    ```

## Usage

1. Build the project for the Raspberry Pi Zero:
    ```sh
    cargo build --target=arm-unknown-linux-gnueabihf
    ```

2. Transfer the binary to your Raspberry Pi Zero:
    ```sh
    scp target/arm-unknown-linux-gnueabihf/debug/your_project pi@raspberrypi.local:/home/pi/
    ```
    or use the provided script to automate the process:
    ```sh
    ./scripts/send_binary_to_server.sh
    ```
    or

3. Run the binary on the Raspberry Pi Zero:
    ```sh
    ssh pi@raspberrypi.local './your_project'
    ```
    or use the provided script to automate the process:
    ```sh
    ./scripts/run_remote_binary.sh
    ```

## Automated Build and Deployment

The `scripts` directory contains scripts for automating the build and deployment process. These scripts can be used to compile the project, transfer the binary to the Raspberry Pi Zero, and run it remotely.

just run the following command:

```sh
./scripts/build_and_run.sh
```


## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## Acknowledgments

Inspired by the Rust community and the growing popularity of Raspberry Pi for embedded systems.
