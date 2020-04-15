#!/bin/sh
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<html><h1>Hello Terraform</h1><br>Please replace me with a proper setup script!</htlm>" > /var/www/html/index.html