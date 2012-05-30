slave_path = value_for_platform(
  ["centos", "redhat", "suse", "fedora" ] => {
    "default" => "/etc/mysql_slave.sql"
  },
  "default" => "/etc/mysql/slave.sql"
)

template "/etc/mysql/slave.sql" do
    path slave_path
    source "connect-slave.sql.erb"
    owner "root"
    group "root"
    mode "0600"
    action :create
end

execute "mysql-setup-slave" do
  command "/usr/bin/mysql -u root #{node['mysql']['server_root_password'].empty? ? '' : '-p' }#{node['mysql']['server_root_password']} < #{slave_path}"
  action :nothing
  subscribes :run, resources("template[/etc/mysql/slave.sql]"), :immediately
end

execute "mysql-start-slave" do
  command "/usr/bin/mysql -u root #{node['mysql']['server_root_password'].empty? ? '' : '-p' }#{node['mysql']['server_root_password']} -e 'START SLAVE'"
end