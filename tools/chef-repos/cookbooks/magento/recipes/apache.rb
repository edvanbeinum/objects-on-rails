web_app "#{node[:magento][:apache][:servername]}" do
  template "apache-vhost.conf.erb"
  ssl false
  notifies :reload, resources("service[apache2]"), :delayed
end

web_app "#{node[:magento][:apache][:servername]}.ssl" do
  template "apache-vhost.conf.erb"
  ssl true
  notifies :reload, resources("service[apache2]"), :delayed
end

%w{default 000-default}.each do |site|
  apache_site "#{site}" do
    enable false
    notifies :reload, resources("service[apache2]"), :delayed
  end
end