#!/bin/bash

# Set the current directory to the script directory
cd "$(dirname "$0")"

cd ../benchmarks/simple-request/rust-actix

# Ok now we run the release binary
./target/release/rust-actix
