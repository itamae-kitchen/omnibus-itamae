#!/bin/bash
gem install package_cloud --no-ri --no-rdoc
for f in pkg/*.deb; do
    OS=ubuntu/trusty
    VERSION=$(echo $f | sed -E 's/.+_(.+)_.+\.deb$/\1/g')

    package_cloud push ryotarai/itamae/$OS/$VERSION $f
done

