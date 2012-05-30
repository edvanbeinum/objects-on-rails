name "development"
description "PHP Development system"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "apt::default",
  "base::ack",
  "base::mc",
  "base::vim",
  "php",
  "php::pear",
  "php::xdebug"
  )
# Attributes applied if the node doesn't have it set already.
default_attributes(
:php => {
  :display_errors => "On",
  :html_errors => "On",
  :upload_max_filesize => '20M'
},
:apache => {
  :prefork => {
    :startservers => '10',
    :minspareservers => '10'
    },
    :worker => {
      :startservers => '10',
      :minspareservers => '10'
    },
    :vhosts => [
      {
        :docroot => "/mnt/Sites/bluesq.development.local/public/www",
        :server_name => 'magelinks.development.local'
      }
    ]
  }
)
# Attributes applied no matter what the node has set already.
override_attributes()