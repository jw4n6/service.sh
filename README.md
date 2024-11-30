# service.sh
Script to download a binary and create systemd service for persistence: ([T1543.002](https://attack.mitre.org/techniques/T1543/002/))

Used for adversary emulation and red teaming activities.

Self-deletes after successful execution.

Requires root privileges and binary URL configuration.

# Replace these variables with your specific values
```shell
BINARY_NAME="sysmon"
BINARY_URL="http://IP:PORT/sysmon"
INSTALL_PATH="/usr/local/bin/${BINARY_NAME}"
```
