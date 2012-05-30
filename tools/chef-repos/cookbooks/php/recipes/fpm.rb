pkgs = value_for_platform(
  [ "centos", "redhat", "fedora" ] => {
    "default" => %w{ php53-fpm }
  },
  [ "debian", "ubuntu" ] => {
    "default" => %w{ php5-fpm }
  },
  "default" => %w{ php5-fpm }
)

pkgs.each do |pkg|
    package pkg do
        action :install
    end
end

service "php5-fpm" do
    supports [ :restart, :status, :stop, :start ] 
    action [ :enable, :start ]
end