include_recipe "php::pear"

pat = php_pear_channel "pear.php-tools.net" do
    action :discover
end

php_pear "vfsStream" do
    preferred_state "alpha"
    channel pat.channel_name
    action :install
end