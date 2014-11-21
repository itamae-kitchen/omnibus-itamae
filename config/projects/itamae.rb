
name 'itamae'
maintainer 'ryotarai'
homepage 'https://github.com/ryotarai/itamae' 

install_dir     '/opt/itamae'
build_version   Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency "preparation"

# itamae dependencies/components
dependency 'itamae'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
