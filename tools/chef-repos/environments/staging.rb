name "staging"
description "The staging environment"
default_attributes ({
    "apache2" => {
        "listen_ports" => [ "80", "443" ]
    },
    "mysql" => {
        "server_root_password" => "root"
    },
    "magento" => {
        "db" => {
            "password" => "magentodbpass"
        }
    }
})