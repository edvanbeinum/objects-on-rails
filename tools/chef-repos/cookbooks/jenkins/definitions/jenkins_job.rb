
define :jenkins_job, :enable => true do
  include_recipe "jenkins::cli"
 
  # if params[:enable]
  #   execute "a2enmod #{params[:name]}" do
  #     command "/usr/sbin/a2enmod #{params[:name]}"
  #     notifies :restart, resources(:service => "apache2")
  #     not_if do (File.symlink?("#{node[:apache][:dir]}/mods-enabled/#{params[:name]}.load") and
  #           ((File.exists?("#{node[:apache][:dir]}/mods-available/#{params[:name]}.conf"))?
  #             (File.symlink?("#{node[:apache][:dir]}/mods-enabled/#{params[:name]}.conf")):(true)))
  #     end
  #   end    
  # else
  #   execute "a2dismod #{params[:name]}" do
  #     command "/usr/sbin/a2dismod #{params[:name]}"
  #     notifies :restart, resources(:service => "apache2")
  #     only_if do ::File.symlink?("#{node[:apache][:dir]}/mods-enabled/#{params[:name]}.load") end
  #   end
  # end
end