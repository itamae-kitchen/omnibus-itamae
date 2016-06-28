source 'https://rubygems.org'

# Use Berkshelf for resolving cookbook dependencies
gem 'berkshelf', '~> 3.0'

# Install omnibus software
#gem 'omnibus', '~> 4.0.0'
gem 'omnibus', github: 'chef/omnibus'
#gem 'omnibus'

# Use Chef's software definitions. It is recommended that you write your own
# software definitions, but you can clone/fork Chef's to get you started.
gem 'omnibus-software', github: 'ryotarai/omnibus-software', branch: 'for-itamae'

# Use Test Kitchen with Vagrant for converging the build environment
gem 'test-kitchen',    '~> 1.2'
gem 'kitchen-vagrant', '~> 0.14'
