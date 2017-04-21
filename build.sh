#!/usr/bin/env bash

set -e

echo "Compiling for linux..."
GOOS=linux GOARCH=amd64 go build .

echo "Constructing Dockerimage"
docker build -t="gstackio/sample-app" .
docker push gstackio/sample-app

echo "Cleaning up..."
rm sample-app
