include_recipe "varnish"

template "#{node[:varnish][:dir]}/default.vcl" do
  source "varnish.vcl.erb"
  owner "root"
  group "root"
  mode 0644
end