#!/bin/bash
# NOTE: This file will be executed as remoteUser (devcontainer.json)
echo "=> Script: post-create.sh Executed by: $(whoami)"

sudo npm install --silent --progress=false --global gulp-cli commitizen@latest cz-conventional-changelog@latest semantic-release-cli@latest

# shellcheck source=/dev/null
source ~/.zshrc

# install composer deps
composer install
npm ci

RET=1
totalTries=0
while [[ RET -ne 0 ]]; do
    ((totalTries++))
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    sudo mysql -uroot -e "status" >/dev/null 2>&1
    RET=$?

    # terminate after 10 tries and avoid endless loops
    if [ "$totalTries" -ge 10 ]; then
        exit 1
    fi    
done

    echo "Executing Blesta SQL Import"
    # wait till the database has been created
    DBFOUND=0
    totalTries=0
    while [[ DBFOUND -ne 1 ]]; do
        ((totalTries++))
        echo "=> Waiting for the confirmation of MySQL Database creation"
        sleep 2
        DBFOUND=$(sudo mysql -uroot -e "show databases;" | grep -c "blestadb")
        # terminate after 10 tries and avoid endless loops
        if [ "$totalTries" -ge 10 ]; then
            exit 1
        fi
    done
    echo "=> Importing SQL Backup"
    sudo mysql -uroot blestadb < /usr/share/000_backup.sql

    # Generate symlinks and update extracted files permissions 
    echo "=> Generating Symlinks"
    sudo -i /usr/share/setsymlinks.sh

exit 0