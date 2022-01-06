#!/bin/bash
LATEST=$(curl -s "https://api.github.com/repos/docker/compose/releases/latest" | grep -mi1 "browser_download_url.*$(uname -s)-$(uname -m)" | cut -d ":" -f 2,3 | tr -d \") \
&& sudo curl -L ${LATEST} -o /usr/local/bin/docker-compose \
&& sudo chmod +x /usr/local/bin/docker-compose \
&& docker-compose --version