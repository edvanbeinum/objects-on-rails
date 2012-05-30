# Installs the latest version of PHPMD

include_recipe "php::pear"

pd = php_pear_channel "pear.pdepend.org" do
  action :discover
end

execute "install-PHP_Depend" do
  command "pear -d preferred_state=stable install -a pear.pdepend.org/PHP_Depend | cat"
end
