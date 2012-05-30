# Installs (or upgrades to) a particular version of PHPUnit.  See
#
# http://www.phpunit.de/manual/current/en/installation.html

include_recipe "php::pear"

channels = [
    "pear.horde.org", 
    "pear.symfony-project.com", 
    "components.ez.no"
]

channels.each do |chan|
  php_pear_channel chan do
    action :discover
  end
end

pu = php_pear_channel "pear.phpunit.de" do
  action :discover
end

php_pear "PHP_CodeBrowser" do
  preferred_state "beta"
  channel pu.channel_name
  action :install
end 