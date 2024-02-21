#!/bin/bash

# Add systemd service file and configure it
systemctl daemon-reload
systemctl enable webapp.service

# Start the service
systemctl start webapp.service