# TODO place the cli file in a persistent location
# http://ci.dreams.sessiondigital.com:8080/jnlpJars/jenkins-cli.jar
include_recipe "jenkins"
remote_file "/var/lib/jenkins/jenkins-cli.jar" do
  source "http://localhost:8080/jnlpJars/jenkins-cli.jar"
  owner "jenkins"
  group "jenkins"
  mode 0755
  action :create
end