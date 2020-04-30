#!/bin/sh
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<html><h1>Hello Terraform</h1><br>Please replace me with a proper setup script!</htlm>" > /var/www/html/index.html