#!/bin/bash
set -e

WORKDIR="$(cd $(dirname $(dirname $0)); pwd)"
cd $WORKDIR

for dist in trusty; do
    echo "Building a deb package for ${dist}..."
    docker build -t omnibus-itamae-builder:$dist -f dockerfiles/$dist .
    docker run --rm -v $(pwd):/work -it omnibus-itamae-builder:$dist /bin/bash -c "
        cd /work && \
        bundle exec omnibus build itamae
    "

    cd pkg
    for f in *.deb; do
        NAME=$(echo $f | cut -d_ -f1)
        FIRST_CHAR=$(echo $NAME | cut -c1)
        VERSION=$(echo $f | cut -d_ -f2)
        ARCH=$(echo $f | cut -d_ -f3 | cut -d. -f1)

        curl -v -T $f -u${BINTRAY_USERNAME}:${BINTRAY_API_KEY} "https://api.bintray.com/content/itamae/itamae/itamae/${VERSION}/pool/contrib/${FIRST_CHAR}/${f};deb_distribution=${dist};deb_component=contrib;deb_architecture=${ARCH};publish=1"

        rm $f
    done
done

