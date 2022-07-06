#!/bin/bash

# Set the current directory to the script directory
cd "$(dirname "$0")"

cd ../benchmarks/simple-request/kotlin-vertx

java -Xms100m -Xmx7g -jar build/libs/simple-request-1.0.0-SNAPSHOT-fat.jar
