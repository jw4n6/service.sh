# service.sh
This script automates the download of a remote payload, creation and setup of a systemd service for persistence: ([T1543.002](https://attack.mitre.org/techniques/T1543/002/))

The script self-deletes after successful execution.

Used for adversary emulation and red teaming activities.

# Replace these variables with your specific values
```shell
BINARY_NAME="sysmon"
BINARY_URL="http://IP:PORT/sysmon"
INSTALL_PATH="/usr/local/bin/${BINARY_NAME}"
```
