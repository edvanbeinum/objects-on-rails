include_recipe "php"
include_recipe "php::zendframework"
include_recipe "php::pear"

mt = php_pear_channel "pear.magetool.co.uk" do
  action :discover
end

php_pear "magetool" do
  preferred_state "beta"
  channel mt.channel_name
  action :install
end

# This overwrites whatever was in .zf.ini beforehand, and also is
# hardcoded to the "user" user.  Is there any easy way to "push" onto
# the basicloader.classes array?

filePath = "/home/user/.zf.ini"
user = "user"

if File.exists?("/home/vagrant/")
    filePath = "/home/vagrant/.zf.ini" 
    user = "vagrant" 
end

file filePath do
  owner user
  mode "0644"
  content [
    "php.include_path = \".:/usr/share/php:/usr/share/pear\"",
    "basicloader.classes.0 = \"MageTool_Tool_Manifest\""
  ].join("\n")
end