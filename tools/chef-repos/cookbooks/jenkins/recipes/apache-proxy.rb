include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_http"

# add new vHost for passing requests off to Tomcat
web_app node[:jenkins][:apache][:servername] do
  template "apache-vhost.conf.erb"
  notifies :reload, resources("service[apache2]"), :immediate
end