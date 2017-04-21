#!/usr/bin/env bash

set -e

DOCKER_REPO=${DOCKER_REPO:-gstack/sample-app}
DOCKER_TAG=${DOCKER_TAG:-latest}

RESET=$(tput sgr0)
BOLD=$(tput bold)
GREEN=$(tput setaf 2)

function headline() {
    local msg=$1
    echo -e "\n${BOLD}${GREEN}$msg${RESET}"
}

function exit_trap() {
    headline "Cleaning up..."
    rm sample-app
}
trap exit_trap EXIT

headline "Compiling for linux..."
GOOS=linux GOARCH=amd64 go build .

headline "Constructing Docker image"
docker build -t="$DOCKER_REPO:$DOCKER_TAG" .

headline "Pushing image to Docker hub"
docker push "$DOCKER_REPO:$DOCKER_TAG"
