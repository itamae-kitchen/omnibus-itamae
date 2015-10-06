#!/bin/bash
set -e
umask 0066

WORKDIR="$(cd $(dirname $(dirname $0)); pwd)"
cd $WORKDIR

gpg -o tmp/E6506E2E.key --export-secret-keys E6506E2E

aws s3 sync s3://packages.itamae.kitchen/ static

for dist in trusty; do
    echo "Building a deb package for ${dist}..."
    docker build -t omnibus-itamae-builder:$dist -f dockerfiles/$dist .
    docker run --rm -v $(pwd):/work -it omnibus-itamae-builder:$dist /bin/bash -c "
        cd /work && \
        gpg --import tmp/E6506E2E.key && \
        bundle exec omnibus build itamae && \
        cd static/deb && \
        reprepro includedeb trusty ../../pkg/*.deb
    "
    rm -f pkg/*
done

aws s3 sync static s3://packages.itamae.kitchen/ --grants 'read=uri=http://acs.amazonaws.com/groups/global/AllUsers'

# purge cache
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/60592b2ad238b2c52c5d2b53b26c7c7a/purge_cache" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_AUTH_KEY}" \
    -H "Content-Type: application/json" \
    --data '{"purge_everything":true}'
