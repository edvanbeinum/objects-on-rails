crontabfile = "/tmp/chef-crontab.txt" 
    
template "crontab" do
  path crontabfile
  source "magento-crontab.erb"
  mode 0655
  variables(variables)
end

execute "crontab" do
  command "crontab -u root #{crontabfile}"
  action :run
  timeout 60
end