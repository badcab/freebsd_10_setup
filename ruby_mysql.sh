#! /bin/sh

#this script should install ruby on rails, apache and mysql as well as establish a mysql db user and a lot of gems and the like

pkg install -y ruby devel/ruby-gems rubygem-rails apache24 rubygem-passenger rubygem-mysql2 rubygem-bootstrap rubygem-jquery libxml2 libxslt mysql55-server node-devel ruby-devel mysql-devel wget 

#should consider using gem install instead of ports

#add the passenger gem to the include part of apache

#have apache and mysql start in rc.conf


#create a root user for mysql, use argv for the password

rails new ARGV[0]
bundle install






#create a script in /usr/local/bin/ror-setup
#should take a name, dbuser, dbpassword, dbname

