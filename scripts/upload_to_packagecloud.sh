#!/bin/bash
for f in pkg/*.deb; do
    OS=ubuntu/trusty
    VERSION=$(echo $f | sed -E 's/.+_(.+)_.+\.deb$/\1/g')

    # 20: ubuntu trusty
    curl -X POST https://$PACKAGECLOUD_TOKEN:@packagecloud.io/api/v1/repos/ryotarai/itamae/packages.json \
         -F "package[distro_version_id]=20" \
         -F "package[package_file]=@$f"
done

