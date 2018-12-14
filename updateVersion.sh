#!/bin/bash

# THIS SCRIPT UPDATES THE HARDCODED VERSION
# IT WILL BE EXECUTED IN STEP "prepare" OF
# semantic-release. SEE package.json

# version format: X.Y.Z
newversion="$1";
branch="$2";

if [ "$branch" = "master" ]; then
    sed -i "s/private static \$version = \"[0-9]\+\.[0-9]\+\.[0-9]\+\"/private static \$version = \"${newversion}\"/g" ispapi.php
    sed -i "s/\"version\": \"[0-9]\+\.[0-9]\+\.[0-9]\+\"/\"version\": \"${newversion}\"/g" release.json
    sed -i "s/\"date\": \"[0-9]\+-[0-9]\+-[0-9]\+\"/\"date\": \"${date}\"/g" release.json
fi;
