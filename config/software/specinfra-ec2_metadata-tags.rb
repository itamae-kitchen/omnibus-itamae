name "specinfra-ec2_metadata-tags"
default_version "0.0.4"

dependency "ruby"
dependency "rubygems"

env = {
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do
  gem "install specinfra-ec2_metadata-tags --no-doc -v #{version}", env: env
end
