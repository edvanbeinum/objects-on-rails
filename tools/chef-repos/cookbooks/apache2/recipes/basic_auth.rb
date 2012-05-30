if node[:apache][:basic_username]
  include_recipe "apache2::mod_authn_file"
  include_recipe "apache2::mod_authz_user"

  execute "create .htpasswd file in docroot" do
    command "htpasswd -bc #{node[:apache][:docroot]}/.htpasswd #{node[:apache][:basic_username]} #{node[:apache][:basic_password]}"
	not_if do File.exists?("#{node[:apache][:docroot]}/.htpasswd") end
  end

  template "#{node[:apache][:docroot]}/.htaccess" do
    source "htaccess.erb"
    mode 0644
    owner "root"
    group "root"
  end
end
