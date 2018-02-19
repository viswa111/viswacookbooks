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

file '/var/www/html/index.html' do
action :delete
end

execute 'setting downloading wordpress' do
command 'wget https://wordpress.org/latest.tar.gz -O /var/www/html/latest.tar.gz'
creates "/var/www/html/latest.tar.gz"
end

execute 'executing tar command' do
command 'tar -xvzf /var/www/html/latest.tar.gz'
cwd '/var/www/html/'
creates "/var/www/html/wordpress/index.php"
end

execute 'copying wordpress file' do
command 'cp -R /var/www/html/wordpress/* /var/www/html/'
cwd '/var/www/html/'
creates '/var/www/html/index.php'
end

cookbook_file "/tmp/mysqlcommands" do
source "mysqlcommands"
end

cookbook_file "/var/www/html/wp-config.php"  do
source "wp-config.php"
end

execute 'setting-up database' do
command 'mysql -u root -pabcd1234 < /tmp/mysqlcommands && touch /tmp/file5.txt'
creates '/tmp/file5.txt'
end








