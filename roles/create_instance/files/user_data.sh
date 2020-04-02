#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
sudo locale-gen pt_BR.UTF-8
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl git