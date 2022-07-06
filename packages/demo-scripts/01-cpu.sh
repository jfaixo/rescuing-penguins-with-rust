#!/bin/bash

echo "Stressing 1 CPU..."
stress -t 20 -c 1

echo "Stressing 2 CPU..."
stress -t 20 -c 2

echo "Stressing 3 CPU..."
stress -t 20 -c 3

echo "Stressing 4 CPU..."
stress -t 20 -c 4

