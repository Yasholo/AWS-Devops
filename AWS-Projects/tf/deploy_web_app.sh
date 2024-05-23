#!/bin/bash

# Update system packages
sudo apt update
sudo apt upgrade -y

# Install Apache HTTP server, PHP, and MySQL
sudo apt install -y apache2 php mysql-server php-mysql

# Secure MySQL installation
sudo mysql_secure_installation

# Create the MySQL database and table
sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS task_manager;
USE task_manager;
CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF

# Deploy PHP files to Apache document root
sudo git clone https://github.com/Yasholo/php-web_app.git /var/www/html

# Start Apache HTTP server
sudo systemctl start apache2
sudo systemctl enable apache2

# Output success message
echo "Web application deployed successfully."
