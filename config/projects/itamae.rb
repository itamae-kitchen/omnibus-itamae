name 'Itamae'
maintainer 'Ryota Arai'
homepage 'https://github.com/ryotarai/itamae' 

install_dir '/opt/itamae'
build_version do
  source :version, from_dependency: 'itamae'
end
# build_iteration 1

# creates required build directories
dependency "preparation"

# itamae dependencies/components
dependency 'itamae'
dependency 'specinfra-ec2_metadata-tags'
override 'ruby', version: '2.1.5'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'

package :deb do
  license 'MIT'
  vendor 'Ryota Arai <ryota.arai@gmail.com>'
end
