name "webserver"
description "PHP Webserver"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "apt",
  "php",
  "apache2",
  "apache2::mod_php5",
  "apache2::mod_rewrite",
  "apache2::mod_ssl",
  "apache2::mod_deflate",
  "apache2::mod_expires",
  "apache2::mod_headers" ,
  "apache2::vhost"
)
# Attributes applied if the node doesn't have it set already.
default_attributes()
# Attributes applied no matter what the node has set already.
override_attributes()