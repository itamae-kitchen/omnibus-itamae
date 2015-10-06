#!/bin/bash
umask 0066

WORKDIR="$(cd $(dirname $(dirname $0)); pwd)"
cd $WORKDIR

gpg -o tmp/E6506E2E.key --export-secret-keys E6506E2E

for dist in trusty; do
    echo "Building a deb package for ${dist}..."
    docker build -t omnibus-itamae-builder:$dist -f dockerfiles/$dist .
    docker run -v $(pwd):/work -it omnibus-itamae-builder:$dist /bin/bash -c "
        cd /work && \
        gpg --import tmp/E6506E2E.key && \
        bundle exec omnibus build itamae && \
        cd deb && \
        reprepro includedeb trusty ../pkg/*.deb
    "
    rm -f pkg/*
done
