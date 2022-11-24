#!/bin/bash
if ! [[ $1 =~ ^blesta|whmcs|litespeed|(node)-sdk|statistics$ ]]
then
    echo "Scenario \"$1\" unknown. Candidates are: whmcs, blesta, statistics, litespeed or node-sdk"
    exit 1
fi

# start ubuntu/litespeed/PHP
if [[ $1 == "litespeed" ]]
then
  docker run -d \
    --name litespeed \
    -p 7080:7080 \
    -p 80:8888 \
    -it litespeedtech/litespeed:latest
  exit 0;
fi

# start blesta / whmcs
if [[ $1 == "blesta" || $1 == "whmcs" ]]
then
  docker ps -a | grep dstack | cut -d ' ' -f 1 | xargs docker stop | xargs docker rm
  cd "$1" || exit
  docker compose up -d --build
  cd ..
  exit 0;
fi

if [[ $1 == "node-sdk" ]]; then
    CWD="$PWD";
    DOCPATH="$HOME/git/node-sdk"
    WORKDIR="/usr/share/node-sdk"
    if [[ ! -d "$DOCPATH" ]]; then
      echo "$DOCPATH does not exist. Please clone the repository accordingly."
      exit 1
    fi
    cd "$DOCPATH" || exit #it won't work without cd'ing
    docker run --rm \
    --volume="$HOME/git/node-sdk:$WORKDIR" \
    --workdir="$WORKDIR" \
    -it node:16 \
    npm run test
    cd "$CWD" || exit;
    exit 0;
fi

if [[ $1 == "statistics" ]]; then
    CWD="$PWD";
    DOCPATH="$HOME/git/statistics"
    WORKDIR="/var/www/html/statistics"
    if [[ ! -d "$DOCPATH" ]]; then
      echo "$DOCPATH does not exist. Please clone the repository accordingly."
      exit 1
    fi
    #cd "$DOCPATH" || exit #it won't work without cd'ing
    docker run -d \
    -p 8080:80 \
    --volume="$DOCPATH:$WORKDIR" \
    --volume="$HOME/git/docker/statistics/001-statistics.conf:/etc/apache2/sites-enabled/001-statistics.conf" \
    --volume="$HOME/git/docker/statistics/php.ini:/etc/php7.4/apache2/php.ini" \
    papakai/ubuntu_php_apache:latest
    #cd "$CWD" || exit;
    exit 0;
fi