name "mysql-master"
description "mySQL MASTER database server running mySQL 5.x. This role has not specific application configuration and should be used in conjunction with application specific roles."
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "mysql::server"
  )
# Attributes applied if the node doesn't have it set already.
default_attributes()
# Attributes applied no matter what the node has set already.
override_attributes "mysql" => {"master" => true, "slave" => false}