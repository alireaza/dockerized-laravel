#!/bin/bash

sudo apt-get update -y \
&& sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
&& mkdir -p /etc/apt/keyrings \
&& curl -fsSL "https://download.docker.com/linux/\
$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)\
/gpg" | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
&& sudo chmod a+r /etc/apt/keyrings/docker.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release) \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& sudo apt-get update -y \
&& sudo apt-get install -y docker-ce docker-ce-cli containerd.io \
&& sudo docker --version
