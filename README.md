# macOS Configuration

Ansible playbook for configuring macOS machines.

## Prerequisites

- Ansible installed: `brew install ansible`
- Galaxy collections: `ansible-galaxy collection install -r requirements.yml`

## Quick start

```bash
# Install dependencies
ansible-galaxy collection install -r requirements.yml

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
| `macos-update` | System updates + Xcode CLI tools |
| `homebrew` | Installs Homebrew |
| `macos-defaults` | System preferences (Dock, Finder, etc.) |
| `common` | Home directories |
| `macos-sudo` | Configure passwordless sudo |
| `packages-base` | CLI tools via Homebrew |
| `dotfiles` | Dotfiles deployment |
