name "dev"
description "The development environment"
override_attributes ({
    "apache2" => {
        "listen_ports" => [ "80", "443" ]
    },
    "mysql" => {
        "server_root_password" => "root"
    },
    "magento" => {
        "dir" => "/mnt/Sites/dreams.development.local/public",
        "apache" => {
            "servername" => "dreams.development.local",
            "serveralis" => [
                    "dreams.css.development.local",
                    "dreams.imgs.development.local",
                    "dreams.js.development.local"
                ],
            "docroot" => "/mnt/Sites/dreams.development.local",
            "path" => "/public"
        },
        "db" => {
            "password" => "magentodbpass"
        }
    }
})