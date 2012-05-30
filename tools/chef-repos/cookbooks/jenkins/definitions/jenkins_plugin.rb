
define :jenkins_job, :enable => true do
  include_recipe "jenkins::cli"
 
  if params[:enable]
    execute "install #{params[:name]}" do
      command "/usr/sbin/a2enmod #{params[:name]}"
      notifies :restart, resources(:service => "jenkins")
      not_if do (File.symlink?("#{node[:apache][:dir]}/mods-enabled/#{params[:name]}.load") and
            ((File.exists?("#{node[:apache][:dir]}/mods-available/#{params[:name]}.conf"))?
              (File.symlink?("#{node[:apache][:dir]}/mods-enabled/#{params[:name]}.conf")):(true)))
      end
    end    
  else
    execute "remove #{params[:name]}" do
      command "/usr/sbin/a2dismod #{params[:name]}"
      notifies :restart, resources(:service => "jenkins")
      only_if do ::File.symlink?("#{node[:apache][:dir]}/mods-enabled/#{params[:name]}.load") end
    end
  end
end