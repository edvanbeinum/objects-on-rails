include_recipe "jenkins"
include_recipe "php::xdebug"
include_recipe "php::depend"
include_recipe "php::phpmd"
include_recipe "php::copypaste"
include_recipe "php::phploc"
include_recipe "php::documentor"
include_recipe "php::codesniffer"
include_recipe "php::codebrowser"
include_recipe "php::vfsStream"
include_recipe "php::phpunit"

path = value_for_platform(
  ["centos", "redhat", "fedora"] => {"default" => "/usr/lib/jenkins"},
  "default" => "/usr/lib/jenkins"
)

modules = [
  "template-project",
  "git",
  "github",
  "greenballs",
  "checkstyle",
  "clover",
  "cloverphp",
  "dry",
  "htmlpublisher",
  "jdepend",
  "plot",
  "pmd",
  "violations",
  "xunit",
  "ci-game",
  "chucknorris"
]

ruby_block "wait_for_server_to_be_available" do
   block do
     sleep 30
   end
   action :create
end

modules.each do
  |mod|
  cli_command = "java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin #{mod}"
  log(cli_command) { level :info }
  bash "install_#{mod}" do
    user "jenkins"
    cwd "/var/lib/jenkins"
    code cli_command
    notifies :reload, resources("service[jenkins]"), :delayed
  end
end

git "/var/lib/jenkins/jobs/php-template" do
  repository "git://github.com/sebastianbergmann/php-jenkins-template.git"
  reference "master"
  user "jenkins"
  group "jenkins"
  action :sync
end


bash "restart_jenkins" do
  user "root"
  cwd "/tmp"
  code "java -jar jenkins-cli.jar -s http://localhost:8080/ restart"
end
