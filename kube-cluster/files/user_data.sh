#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
sudo locale-gen en_US.UTF-8
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl git
sudo apt-get install -y python