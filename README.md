# macOS Configuration

Ansible playbook for configuring macOS machines.

## Prerequisites

- Ansible installed: `brew install ansible`
- Galaxy collections: `ansible-galaxy collection install -r requirements.yml`
- `dockutil` available (used by the `macos-defaults` role): `brew install dockutil`
- Optional (recommended for unattended updates): run `./00prerequiste.sh` once to allow passwordless `/usr/sbin/softwareupdate`

## Quick start

```bash
# Install dependencies
ansible-galaxy collection install -r requirements.yml

# Optional: allow passwordless softwareupdate for update role
./00prerequiste.sh

# Run
./01run
```

## Usage

```bash
ansible-playbook playbook.yml --diff
```

Use tags to run specific parts:

```bash
ansible-playbook playbook.yml --tags update     # system updates only
ansible-playbook playbook.yml --tags homebrew  # Homebrew only
ansible-playbook playbook.yml --tags defaults  # macOS defaults
```

## Configuration

Edit `inventory/group_vars/`:

| File | Description |
|---|---|
| `all/vars.yml` | User, timezone, home dirs |
| `macos.yml` | Homebrew casks/formulas |

## Roles

| Role | Description |
|---|---|
| `macos-update` | System updates + Xcode CLI tools (uses passwordless `softwareupdate` when configured) |
| `homebrew` | Installs Homebrew |
| `macos-defaults` | System preferences (Dock, Finder, menu bar, screenshots) and Dock stack setup via `dockutil` |
| `common` | Home directories |
| `macos-sudo` | Configure passwordless sudo for `/usr/sbin/softwareupdate` |
| `packages-base` | CLI tools via Homebrew |
| `dotfiles` | Dotfiles deployment |
