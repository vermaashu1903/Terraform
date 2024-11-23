#!/bin/bash

sudo apt update -y &&
sudo apt install nginx -y &&
echo "Hello Nginx World" > /var/www/html/index.html