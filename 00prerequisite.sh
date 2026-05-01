#!/bin/bash

set -euo pipefail

USER=$(whoami)
SUDOERS_FILE="/etc/sudoers.d/softwareupdate"

echo "Configuring passwordless sudo for /usr/sbin/softwareupdate"

echo "$USER ALL=(root) NOPASSWD: /usr/sbin/softwareupdate" | sudo tee "$SUDOERS_FILE" >/dev/null
sudo chmod 0440 "$SUDOERS_FILE"
sudo visudo -cf "$SUDOERS_FILE"

echo "Done."
