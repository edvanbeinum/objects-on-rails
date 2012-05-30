
if File.exists?("/etc/yum.repos.d/ius.repo")
    packages = %w{ php53u-mcrypt }
else
    packages = %w{ php-mcrypt }
end

pkgs = value_for_platform(
  [ "centos", "redhat", "fedora" ] => {
    "default" => packages
  },
  [ "debian", "ubuntu" ] => {
    "default" => %w{ php5-mcrypt }
  }
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file "#{node['php']['ext_conf_dir']}/mcrypt.ini" do
  owner "root"
  group "root"
  mode "0644"
  source "mcrypt.ini"
end