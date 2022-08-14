#!/bin/bash

sudo apt update;
sudo apt install nginx apache2 -y;

echo "Installed apache and nginx"

sudo mkdir /opt/nginx;
sudo cp /home/stas/homework/Stanislav-Gest-DevOps-homework/HW17/files/test.html /opt/nginx/test.html;
sudo cp /home/stas/homework/Stanislav-Gest-DevOps-homework/HW17/files/test.txt /opt/nginx/test.txt;
sudo cp /home/stas/homework/Stanislav-Gest-DevOps-homework/HW17/files/nginx.conf /opt/nginx/nginx.conf;

sudo cat /opt/nginx/nginx.conf > /etc/nginx/nginx.conf;
sudo systemctl restart nginx

echo "Launched nginx on 8084"

sudo mkdir /opt/apache;
sudo cp /home/stas/homework/Stanislav-Gest-DevOps-homework/HW17/files/test.html /opt/apache/test.html;
sudo cp /home/stas/homework/Stanislav-Gest-DevOps-homework/HW17/files/test.txt /opt/apache/test.txt;
sudo cp /home/stas/homework/Stanislav-Gest-DevOps-homework/HW17/files/apache2.conf /opt/apache/apache2.conf;

sudo cat /opt/apache/apache2.conf > /etc/apache2/apache2.conf;
sudo systemctl restart apache2

echo "Launched apache on 8085"

echo "All done"











