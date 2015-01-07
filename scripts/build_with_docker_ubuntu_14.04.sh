#!/bin/sh
DIR=$(dirname $(cd $(dirname $0); pwd))
docker run -v $DIR:/app ubuntu:14.04 /bin/bash -ex -c \
'git config --global user.email "ryota.arai+itamae@gmail.com"
git config --global user.name "Itamae Builder"
apt-get update
apt-get install -y software-properties-common git-core build-essential
apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y ruby2.2 ruby2.2-dev
gem install bundler
cd /app
bundle install -j4
bundle exec omnibus build itamae'
