name "ruby-development"
description "Ruby Development system"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "apt::default",
  "base::ack",
  "base::mc",
  "base::vim",
  "rvm::install"
  )
# Attributes applied if the node doesn't have it set already.

# Attributes applied no matter what the node has set already.
override_attributes(
  :rvm => { :ruby => { :implementation => "ruby", :version => "1.9.3" } }
)