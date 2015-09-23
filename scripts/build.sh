#!/bin/bash
WORKDIR="$(cd $(dirname $(dirname $0)); pwd)"

docker run -v $WORKDIR:/work -it $1 /bin/bash -ec '
cd /work
git config --global user.email "ryota.arai+itamae@gmail.com" && git config --global user.name "Itamae Builder"
bundle install -j4
bundle update
bundle exec omnibus build itamae
'
