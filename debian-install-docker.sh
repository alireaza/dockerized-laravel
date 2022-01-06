#!/bin/bash

sudo apt-get update -y \
&& sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
&& curl -fsSL "https://download.docker.com/linux/\
$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)\
/gpg" | sudo apt-key add - \
&& sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/\
$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release) \
$(lsb_release -cs) \
stable" \
&& sudo apt-get update -y \
&& sudo apt-get install -y docker-ce docker-ce-cli containerd.io \
&& sudo docker -v