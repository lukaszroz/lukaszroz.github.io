#!/bin/bash
set -x
set -e

## display some debug logs (please disable to hide your sensitive credentials!)
#pwd
#env

# update themes submodules
git submodule update --init --recursive

# download hugo 0.16 release
HUGO=0.16_linux-64bit
DIR=`mktemp -d`

curl -L -o $DIR/hugo_$HUGO.tgz https://github.com/spf13/hugo/releases/download/v0.16/hugo_$HUGO.tgz
tar xvf $DIR/hugo_$HUGO.tgz -C $DIR

# build the static web content
$DIR/hugo

# push the static web content to gh-pages
./deploy.sh
