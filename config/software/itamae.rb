name "itamae"
default_version "1.1.14"

dependency "ruby"
dependency "rubygems"

env = {
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do
  gem "install itamae --no-ri --no-rdoc -v #{version}", env: env
end
