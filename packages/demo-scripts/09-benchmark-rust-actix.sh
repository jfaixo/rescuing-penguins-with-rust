#!/bin/bash

# Set the current directory to the script directory
cd "$(dirname "$0")"

cd ../benchmarks/simple-request/rust-actix

# Trolling attempt, performance of Rust in debug mode are similar to the ones of fastify clustered
./target/debug/rust-actix
