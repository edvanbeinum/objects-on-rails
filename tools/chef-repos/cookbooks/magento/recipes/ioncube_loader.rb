#
# Cookbook Name:: magento-ee
# Recipe:: ioncube_loader
#
# Copyright 2010, Ibuildings UK
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

arch = %x[uname -m]
if (arch.strip == "i686")
  script "install_ioncube_x86" do
    interpreter "bash"
    user "root"
    code <<-EOH
      cd /tmp
      wget http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz
      cd /usr/local
      tar xfz /tmp/ioncube_loaders_lin_x86.tar.gz
    EOH
    not_if do File.exists?("/usr/local/ioncube") end
  end  
else
  script "install_ioncube_x86-64" do
    interpreter "bash"
    user "root"
    code <<-EOH
      cd /tmp
      wget http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
      cd /usr/local
      tar xfz /tmp/ioncube_loaders_lin_x86-64.tar.gz
    EOH
    not_if do File.exists?("/usr/local/ioncube") end
  end  
end

cookbook_file "/etc/php5/conf.d/ioncube.ini" do
  source "ioncube.ini"
  mode "0644"
  notifies :reload, resources("service[apache2]"), :delayed
end