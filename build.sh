#!/bin/bash
set -x
set -e

## display some debug logs (please disable to hide your sensitive credentials!)
#pwd
#env

# update themes submodules
git submodule update --init --recursive

# download hugo 0.16 release
curl -L -o /tmp/hugo_$HUGO.tgz https://github.com/spf13/hugo/releases/download/v0.16/hugo_$HUGO.tgz
tar xvf /tmp/hugo_$HUGO.tgz -C /tmp/hugo_$HUGO
mv /tmp/hugo_$HUGO/hugo /usr/bin/hugo

# build the static web content
hugo

# push the static web content to gh-pages
./deploy.sh
