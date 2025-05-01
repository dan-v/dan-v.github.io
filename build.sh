#!/bin/bash
set -euo pipefail

# Clean up any existing containers and dist directory
docker rm -f css-builder-container 2>/dev/null || true
rm -rf dist

# Create dist directory
mkdir -p dist

# Build CSS using Docker
echo "Building CSS..."
docker build -t css-builder .

# Create container and copy files
echo "Copying built files..."
docker create --name css-builder-container css-builder
docker cp css-builder-container:/app/dist/style.css ./dist/style.css

# Cleanup
echo "Cleaning up..."
docker rm css-builder-container

echo "Build complete! CSS file is at dist/style.css"