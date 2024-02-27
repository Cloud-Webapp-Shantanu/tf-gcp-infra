#!/bin/bash

# Accessing environment variables set by Terraform
DB_NAME="${DB_NAME}"
DB_USER="${DB_USER}"
DB_PASSWORD="${DB_PASSWORD}"
DB_PORT="${DB_PORT}"
DB_HOST="${DB_HOST}"

# Create a .env file in the webapp directory
varenv="/opt/csye6225dir/webapp/.env"
> "$varenv"
{
echo "DB_NAME: ${DB_NAME}"
echo "DB_USER: ${DB_USER}"
echo "DB_PASSWORD: ${DB_PASSWORD}"
echo "DB_PORT: ${DB_PORT}"
echo "DB_HOST: ${DB_HOST}"
} >> "$varenv"

# Add systemd service file and configure it
systemctl daemon-reload
systemctl enable webapp.service

# Start the service
systemctl start webapp.service

# touch /etc/environment/startup_completed