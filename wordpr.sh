#!/bin/bash


sudo -i
apt update && upgrade -y
sudo apt install unzip -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt install mysql-server -y
sudo apt install ghostscript \
                 libapache2-mod-php \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml  \
				 php-zip   -y
             

sudo yum install php-gd -y 
sudo systemctl start mariadb
sudo mkdir -p /srv/www
 sudo chown www-data: /srv/www
 curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar -xzf -C /srv/www
 git clone https://github.com/sandeep-sk512/MasterDev.git
cp MasterDev/wordpress.conf  /etc/apache2/sites-available/wordpress.conf

   sudo a2ensite wordpress
   sudo a2enmod rewrite
   sudo a2dissite 000-default
   sudo service apache2 reload

   mysql -u root -e 'CREATE DATABASE wordpress;'
   mysql -u root -e 'CREATE USER "wordpress"@"localhost" IDENTIFIED BY "admin123"; '
   mysql -u root -e 'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost IDENTIFIED BY "admin123";'
   mysql -u root -e 'FLUSH PRIVILEGES;'
   mysql -u root -e 'quit'
   
   sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
   sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
   sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
   sudo -u www-data sed -i 's/password_here/admin123/' /srv/www/wordpress/wp-config.php
   service mysql restart
sudo systemctl enable httpd && sudo systemctl enable mariadb