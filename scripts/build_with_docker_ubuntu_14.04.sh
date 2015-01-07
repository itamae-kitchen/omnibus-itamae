#!/bin/sh
set -ex

DIR=$(dirname $(cd $(dirname $0); pwd))
IMAGE_NAME=omnibus-itamae-ubuntu-14-04

if ! (docker images | grep -q omnibus-itamae-ubuntu-14-04); then
  CID=$(docker run -d -v $DIR:/app ubuntu:14.04 /bin/bash -ex -c \
  'apt-get update
apt-get install -y software-properties-common git-core build-essential
apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y ruby2.2 ruby2.2-dev
gem install bundler
cd /app
git config --global user.email "ryota.arai+itamae@gmail.com"
git config --global user.name "Itamae Builder"
bundle install -j4
')
  echo "Creating base image..."
  docker wait $CID
  IID=$(docker commit $CID)
  docker tag $IID $IMAGE_NAME
fi

docker run -e GNU_ARCHIVE_MIRROR=$GNU_ARCHIVE_MIRROR -v $DIR:/app $IMAGE_NAME /bin/bash -ex -c \
'cd /app
bundle exec omnibus build itamae'
