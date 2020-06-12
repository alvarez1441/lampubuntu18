#!/usr/bin/env bash
#APACHE_USER=wwwhost
#VHOSTS_DOMAINS=(radioqorilazo.com server21.open3w.com)
#https://gist.github.com/vaibhavpandeyvpz/2418b9456df64724ede3510faa82ba7e
sudo apt-get update
sudo ufw allow in "OpenSSH"

# Install Apache
sudo apt-get update
sudo apt-get install apache2
#sudo nano /etc/apache2/apache2.conf # Add ServerName ... directive at bottom
sudo apache2ctl configtest
sudo systemctl restart apache2
sudo ufw allow in "Apache Full"

# Install MySQL
sudo apt-get install mysql-server
sudo mysql_secure_installation

# Install PHP
sudo apt-get install php7.1 libapache2-mod-php7.1 php7.1-mcrypt php7.1-mbstring php7.1-curl php7.1-mysql php7.1-gd php7.1-intl php7.1-xsl php7.1-zip phpmyadmin

#sudo nano /etc/apache2/mods-enabled/dir.conf # Move index.php to start
sudo systemctl restart apache2

# Install Composer
sudo apt-get install curl php-cli git
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Secure Apache
##sudo adduser $APACHE_USER
###sudo nano /etc/apache2/envvars # Update APACHE_RUN_USER & APACHE_RUN_GROUP to '$APACHE_USER'

# Create VirtualHosts
###for $DOMAIN in "${VHOSTS_DOMAINS[@]}"
###do
###    sudo mkdir -p /var/www/$DOMAIN/public_html
###    sudo chown -R $APACHE_USER:$APACHE_USER /var/www/$DOMAIN
###then

###sudo chmod -R 755 /var/www

###for $DOMAIN in "${VHOSTS_DOMAINS[@]}"
###do
 ###   sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$DOMAIN.conf
    # Edit & enable vhost after copying
    # sudo nano /etc/apache2/sites-available/$DOMAIN.conf
    # sudo a2ensite $DOMAIN.conf
###then

sudo a2enmod rewrite
sudo a2enmod headers
sudo systemctl restart apache2