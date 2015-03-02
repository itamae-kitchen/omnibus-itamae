#!/bin/sh
set -ex

DIR=$(dirname $(cd $(dirname $0); pwd))

docker run -v $DIR:/app ryotarai/omnibus:trusty /bin/bash -ex -c \
'apt-get -y install libgecode-dev
git config --global user.email "ryota.arai+itamae@gmail.com"
git config --global user.name "Itamae Builder"
cd /app
USE_SYSTEM_GECODE=1 bundle install -j4
bundle exec omnibus build itamae'

