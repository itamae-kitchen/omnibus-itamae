#!/bin/bash
WORKDIR="$(cd $(dirname $(dirname $0)); pwd)"
cd $WORKDIR

for dist in trusty; do
    docker build -t omnibus-itamae-builder:$dist -f dockerfiles/$dist .
    docker run -v $(pwd):/work -it omnibus-itamae-builder:$dist /bin/bash -c "cd /work && bundle exec omnibus build itamae && cd deb && reprepro includedeb trusty ../pkg/*.deb"
done
