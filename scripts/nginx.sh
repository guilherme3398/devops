#!/bin/bash

sudo apt-get update  -y 
sudo apt-get install -y nginx
sudo apt-get install -y unzip


#sudo echo "teste" > /var/www/html/index.nginx-debian.html 


unzip ~/website.zip 
sudo cp index.nginx-debian.html /var/www/html/
sudo cp -r contents /var/www/html/
