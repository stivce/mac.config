#!/bin/bash

set -e

USER=$(whoami)
SUDOERS_FILE="/etc/sudoers.d/softwareupdate"

echo "Setting up restricted passwordless sudo for user: $USER"

echo "$USER ALL=(root) NOPASSWD: /usr/sbin/softwareupdate" | sudo tee "$SUDOERS_FILE" > /dev/null
sudo chmod 0440 "$SUDOERS_FILE"
sudo visudo -cf "$SUDOERS_FILE"

echo "Done. Passwordless sudo enabled for /usr/sbin/softwareupdate only"
