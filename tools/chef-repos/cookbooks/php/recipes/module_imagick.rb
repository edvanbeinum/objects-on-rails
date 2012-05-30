# 
if File.exists?("/etc/yum.repos.d/ius.repo")
    packages = %w{ php53u-imagick }
else
    packages = %w{ php53-imagick }
end

pkgs = value_for_platform(
  [ "centos", "redhat", "fedora" ] => {
    "default" => packages
  },
  [ "debian", "ubuntu" ] => {
    "default" => %w{ php5-imagick }
  }
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end
