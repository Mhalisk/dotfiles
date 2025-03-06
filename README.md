# Dotfiles

This repository contains my dotfiles, which are the config files and scripts I use to customize my development environment. These files help me maintain a consistent setup across different machines and save time when setting up new environments.

## Setup

To set up these dotfiles on your system, run:

```bash
./install.sh
```

Then follow the on-screen prompts.

## Uninstalling

If you ever want to remove the symlinks created by the installation script, you can use the provided symlinks removal script:

To delete all symlinks created by the installation script, run:

```bash
./scripts/symlinks.sh --delete
```

This will remove the symlinks but will not delete the actual configuration files, allowing you to easily revert to your previous configuration if needed.

## Adding New Dotfiles and Software

### Dotfiles

When adding new dotfiles to this repository, follow these steps:

1. Place your dotfile in the appropriate location within the repository.
2. Update the `symlinks_config.conf` file to include the symlink creation for your new dotfile.
3. If necessary, update the `install.sh` script to set up the software.

### Software Installation

Software is installed using Homebrew. To add a formula or cask, update the `homebrew/Brewfile` and run `./scripts/brew_install_custom.sh`. If you need to install a specific version of a package, find its Ruby script in the commit history of an official Homebrew GitHub repository and place it in the `homebrew/custom-casks/` or `homebrew/custom-formulae/` directory, depending on whether it's a cask or formula.
