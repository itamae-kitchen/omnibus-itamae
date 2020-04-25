name "itamae"
default_version "1.10.7"

dependency "ruby"
dependency "rubygems"

env = {
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do
  gem "install itamae --no-ri --no-rdoc -v #{version}", env: env
end
