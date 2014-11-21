name "itamae"
default_version "1.0.7"

dependency "ruby"
dependency "rubygems"

env = {
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do
  gem "install --no-ri --no-rdoc itamae", env: env
  command "sudo ln -fs #{install_dir}/embedded/bin/itamae /usr/local/bin/itamae", env: env
end
