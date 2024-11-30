#!/bin/bash

# Exit on any error
set -e

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Replace these variables with your specific values
BINARY_NAME="sysmon"
BINARY_URL="http://IP:PORT/sysmon"
INSTALL_PATH="/usr/local/bin/${BINARY_NAME}"
SERVICE_NAME="${BINARY_NAME}.service"
SERVICE_PATH="/etc/systemd/system/${SERVICE_NAME}"
USER="root"
GROUP="root"

# Download binary using wget
echo "Downloading binary..."
wget -q "${BINARY_URL}" -O "${INSTALL_PATH}"
chmod +x "${INSTALL_PATH}"

# Create service file
echo "Creating service file..."
cat > "${SERVICE_PATH}" << EOF
[Unit]
Description=SYSMON Service
After=network.target
Wants=network.target

[Service]
Type=simple
ExecStart=${INSTALL_PATH}
User=${USER}
Group=${GROUP}
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# Set proper permissions
chmod 644 "${SERVICE_PATH}"

# Reload systemd, enable and start service
echo "Configuring and starting service..."
systemctl daemon-reload
systemctl enable "${SERVICE_NAME}"
systemctl start "${SERVICE_NAME}"

# Check if service is running
if systemctl is-active --quiet "${SERVICE_NAME}"; then
    echo "Service successfully started"
else
    echo "❌ Service failed to start"
    systemctl status "${SERVICE_NAME}"
    exit 1
fi

# Remove the script from the system
echo "Cleaning up..."
rm -- "$0"

echo "
================================================================================"
echo "                       Installation completed successfully!                 "
echo "================================================================================
"
echo "You can check the service status with: systemctl status ${SERVICE_NAME}"
