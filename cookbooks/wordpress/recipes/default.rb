execute 'sample_execution' do
command 'apt-get update'
end

package "mysql-server" do
action :install
end

service "mysql" do
action :start
end

package "php5" do
action :install
end
 
package "libapache2-mod-php5" do
action :install
end

package "php5-mcrypt" do
action :install
end

package "php5-mysql" do
action :install
end

package "apache2" do
action :install
end

service "apache2" do
action :start
end

execute 'setting mysql root password' do 
command 'mysqladmin -u root password abcd1234 && touch /tmp/done'
creates "/tmp/done"
end
