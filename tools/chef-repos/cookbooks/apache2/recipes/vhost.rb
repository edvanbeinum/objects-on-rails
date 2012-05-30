node[:apache][:vhosts].each do |vhost|
  web_app "#{vhost[:server_name]}" do
    app_name vhost[:server_name]
    server_name vhost[:server_name]
    server_aliases []
    docroot vhost[:docroot]
    notifies :reload, resources("service[apache2]"), :delayed
  end
  apache_site "#{vhost[:server_name]}" do
    enable true
    notifies :reload, resources("service[apache2]"), :delayed
  end
end


%w{default 000-default}.each do |site|
  apache_site "#{site}" do
    enable false
    notifies :reload, resources("service[apache2]"), :delayed
  end
end