#!/bin/bash

# Define the log file
DEPLOY_LOG="deploy_$(date +%Y%m%d_%H%M%S).log"

# Step 2: Deploy the web application
echo "Deploying the web application..." | tee -a "$DEPLOY_LOG"
{
  echo "==== $(date +'%Y-%m-%d %H:%M:%S') Starting Web Application Deployment ===="

  # Update system packages
  echo "Updating system packages..." | tee -a "$DEPLOY_LOG"
  sudo apt update && sudo apt upgrade -y

  # Install Apache HTTP server, PHP, and MySQL
  echo "Installing Apache, PHP, and MySQL..." | tee -a "$DEPLOY_LOG"
  sudo apt install -y apache2 php mysql-server php-mysql

  # Secure MySQL installation non-interactively
  echo "Securing MySQL installation..." | tee -a "$DEPLOY_LOG"
  sudo mysql_secure_installation <<EOF
n
Y
your_mysql_root_password
your_mysql_root_password
Y
Y
Y
Y
EOF

  # Create the MySQL database and table
  echo "Creating MySQL database and table..." | tee -a "$DEPLOY_LOG"
  sudo mysql -u root -p'your_mysql_root_password' <<EOF
CREATE DATABASE IF NOT EXISTS task_manager;
USE task_manager;
CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF

  # Install Git if not already installed
  if ! command -v git &> /dev/null; then
    echo "Installing Git..." | tee -a "$DEPLOY_LOG"
    sudo apt install -y git
  fi

# Clear the Apache document root if it exists and is not empty
if [ -d "/var/www/html" ] && [ "$(ls -A /var/www/html)" ]; then
  echo "Clearing existing content in /var/www/html..." | tee -a "$DEPLOY_LOG"
  sudo rm -rf /var/www/html/*
fi

# Clone the web application from GitHub if the directory is empty
if [ ! -d "/var/www/html" ] || [ ! "$(ls -A /var/www/html)" ]; then
  echo "Cloning web application from GitHub..." | tee -a "$DEPLOY_LOG"
  sudo git clone https://github.com/Yasholo/php-web-app.git /var/www/html
fi

  # Set correct permissions for the web directory
  sudo chown -R www-data:www-data /var/www/html

  # Configure Apache to serve index.php as the default file
  echo "Configuring Apache to serve index.php as the default file..." | tee -a "$DEPLOY_LOG"
  sudo sed -i 's/DirectoryIndex index.html index.cgi index.pl index.xhtml index.htm/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf

  # Restart Apache to apply the changes
  echo "Restarting Apache..." | tee -a "$DEPLOY_LOG"
  sudo systemctl restart apache2

  echo "==== $(date +'%Y-%m-%d %H:%M:%S') Web Application Deployment Completed ===="

} >> "$DEPLOY_LOG" 2>&1

if [ $? -ne 0 ]; thenl
  echo "Web application deployment failed. Check the log file for details: $DEPLOY_LOG" | tee -a "$DEPLOY_LOG"
  exit 1
fi

# Output success message
echo "Web application deployed successfully." | tee -a "$DEPLOY_LOG"