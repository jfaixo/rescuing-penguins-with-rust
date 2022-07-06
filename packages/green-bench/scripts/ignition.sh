#!/bin/bash

# Set the current directory to the script directory
cd "$(dirname "$0")"

CLUSTER_NAME=$(git branch --show-current)

# Just in case, add the traefik repository to Helm
helm repo add traefik https://helm.traefik.io/traefik

# Update the Helm repository
helm repo update

# Install a standard traefik
helm install traefik traefik/traefik

# Install the app
helm install "green-bench-${CLUSTER_NAME}" ../helm-chart
