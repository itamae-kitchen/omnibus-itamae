#!/bin/sh
set -ex

DIR=$(dirname $(cd $(dirname $0); pwd))

docker run -v $DIR:/app ryotarai/omnibus-docker-trusty /bin/bash -ex -c \
'git config --global user.email "ryota.arai+itamae@gmail.com"
git config --global user.name "Itamae Builder"
cd /app
bundle install -j4
bundle exec omnibus build itamae'

