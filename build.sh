#!/bin/bash
set -x
set -e

## display some debug logs (please disable to hide your sensitive credentials!)
#pwd
#env

# update themes submodules
git submodule update --init --recursive

# fetch hugo and show version in build log
if [ "$DRONE" == "true" ]; then
  go get -u -v github.com/spf13/hugo
fi
hugo version

# build the static web content
rm -fr ./public
hugo

# push the static web content to gh-pages
if [ "$DRONE" == "true" ]; then
  echo "...push it"
  ./deploy.sh
else
  echo "...local, don't push"
  xdg-open http://localhost:1313/
  hugo server --buildDrafts
fi
