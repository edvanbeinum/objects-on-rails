include_recipe "php::pear"

channels = [ 
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

php_pear "1.6.1" do
    version "1.6.1"
    preferred_state "stable"
    channel pu.channel_name
    action :install
end