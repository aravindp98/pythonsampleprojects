#!/bin/bash

echo "#############################################################"
echo "##### Installing Packages and start the httpd service #####"
echo "#################################################################"

sudo yum install wget unzip git httpd -y

systemctl start httpd
systemctl enable httpd

echo "#################################################################"
echo "Starting artifact deployment"
echo "#################################################################"

mkdir -p /tmp/webfiles/
cd /tmp/webfiles

echo "#################################################################"
echo "Downloading the website and unzip the webfiles"
echo "#################################################################"

wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip 2137_barista_cafe.zip
cp -rf 2137_barista_cafe/* /var/www/html/

echo "#################################################################"
echo "restart the httpd service"
echo "#################################################################"

systemctl restart httpd
systemctl enable httpd

echo "#################################################################"
echo "delete the webfiles"
echo "#################################################################"

rm -rf /tmp/webfiles/*


