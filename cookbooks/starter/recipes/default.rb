# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

package "apache2" do
  action :install
end
service "apache2" do
action :start
end
file "/tmp/file1" do
  content "Hello world"
end
remote_file "wordpress_latest" do
    source 'http://wordpress.org/latest.tar.gz'
    path "/tmp/latest.tar.gz"
end
cookbook_file "/tmp/sample.txt" do
  source "sample.txt"
end

execute 'sample_execution' do
   command 'wget google.com -O /tmp/index.html'
  # not_if {File.exists?("/tmp/index.html")}
   creates "/tmp/index.html"
end

# For more information, see the documentation: https://docs.chef.io/essentials_cookbook_recipes.html
