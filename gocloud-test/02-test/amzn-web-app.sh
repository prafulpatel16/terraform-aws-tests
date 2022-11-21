#!/bin/bash
# Purpose: Install apache webserver and copy praful's portfolio web application from github to apache webserver
# Author: Praful Patel
# Date & Time: OCT 15,2022 
# ------------------------------------------

# Install httpd apache webserver
sudo yum update -y
sudo yum install -y httpd
# Install git
sudo yum install -y git
sudo yum install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo yum update -y
# Installl php
sudo yum install -y php7.4
sudo yum install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
sudo yum update -y
sudo yum install mysql-client-core-8.0
cd /var/www/html/
sudo rm index.html
# Copy web application source code to apacher web server root directory
sudo git clone https://github.com/prafulpatel16/prafuls-portfolio-webapp1.git
cd prafuls-portfolio-webapp1
sudo cp -r src/* /var/www/html/
# Start apache server  
sudo service httpd start
