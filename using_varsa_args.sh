#!/bin/bash

PACKAGES="wget unzip git httpd"
SVC="httpd"
TMP_FILES="/tmp/webfiles/"
URL="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
ARTIFACT="2137_barista_cafe"


echo "#############################################################"
echo "##### Installing Packages and start the httpd service #####"
echo "#################################################################"

sudo yum install $PACKAGES -y

systemctl start $SVC
systemctl enable $SVC

echo "#################################################################"
echo "Starting artifact deployment"
echo "#################################################################"

mkdir -p $TMP_FILES
cd $TMP_FILES


echo "#################################################################"
echo "Downloading the website and unzip the webfiles"
echo "#################################################################"

wget $URL
unzip $ARTIFACT.zip
cp -rf $ARTIFACT/* /var/www/html/

echo "#################################################################"
echo "restart the httpd service"
echo "#################################################################"

systemctl restart $SVC
systemctl enable $SVC

echo "#################################################################"
echo "delete the webfiles"
echo "#################################################################"

rm -rf $TMP_FILES*

systemctl status $SVC
