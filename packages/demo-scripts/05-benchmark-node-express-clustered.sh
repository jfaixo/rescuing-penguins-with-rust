#!/bin/bash

# Set the current directory to the script directory
cd "$(dirname "$0")"

cd ../benchmarks/simple-request/node-express-clustered

NODE_ENV=production yarn run start
