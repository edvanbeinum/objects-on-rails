template "var/lib/jenkins/.ssh/id_rsa.pub" do
  source "id_rsa.pub.erb"
  mode 0400
  owner "jenkins"
  group "jenkins"
end