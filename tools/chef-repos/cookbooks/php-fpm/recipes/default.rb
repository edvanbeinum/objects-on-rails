#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/usr/local/etc/php-fpm.conf" do
  source "php-fpm.conf"
  owner "root"
  group "root"
  mode "0644"
end

#install init db script
  cookbook_file "/etc/init.d/php-fpm" do
    source "init.d.php-fpm"
    owner "root"
    group "root"
    mode "0755"
  end

  bash "update_startup_script" do
  	user "root"
  	code <<-END
  	sudo update-rc.d -f php-fpm defaults
	sudo touch /var/run/php-fpm.pid
END
end