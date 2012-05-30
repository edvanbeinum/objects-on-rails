bash "Create SSL Certificates" do
  cwd "#{node[:apache][:dir]}/ssl"
  code <<-EOH
  umask 022
  openssl genrsa 2048 > #{node[:magento][:apache][:servername]}.key
  openssl req -batch -new -x509 -days 365 -key #{node[:magento][:apache][:servername]}.key -out #{node[:magento][:apache][:servername]}.crt
  cat #{node[:magento][:apache][:servername]}.crt #{node[:magento][:apache][:servername]}.key > #{node[:magento][:apache][:servername]}.pem
  EOH
  only_if { File.zero?("#{node[:apache][:dir]}/ssl/#{node[:magento][:apache][:servername]}.pem") }
  action :nothing
end

cookbook_file "#{node[:apache][:dir]}/ssl/#{node[:magento][:apache][:servername]}.pem" do
  source "cert.pem"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:bash => "Create SSL Certificates"), :immediately
end