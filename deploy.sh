#!/bin/bash
set -x
set -eu

cd ./public

git init
git config user.name "Lukasz Rozycki"
git config user.email "git@lukaszr.com"

git remote add upstream "https://$GH_TOKEN@github.com/lukaszroz/lukaszroz.github.io.git"
git fetch upstream
git reset upstream/master

git add -A .
git commit -m "Drone.io build #${DRONE_BUILD_ID}, at ${GIT_COMMIT}"
git push -q upstream HEAD:master
