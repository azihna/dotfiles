#!/bin/env bash

# --- Helper Functions ---

function check_package_manager() {
  if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
  elif command -v yum &> /dev/null; then
    PKG_MANAGER="yum"
  else
    echo "Error: Unable to determine package manager. Script supports apt and yum"
    exit 1
  fi
}

function install_packages() {
  if [[ "$PKG_MANAGER" == "apt" ]]; then
    apt update
    apt upgrade -y  # Upgrade existing packages
    if ! apt install -y wget vim zsh curl python3 python3-pip libicu-dev htop iotop lsof ncdu ranger neovim xclip stow; then
      exit_error "Error installing packages via apt"
    fi
  elif [[ "$PKG_MANAGER" == "yum" ]]; then
     # Adjust installation command for yum if needed
     echo "Package installation via yum not yet implemented"
     exit_error "Error: Cross-distribution support incomplete" 
  fi
}

function setup_zsh() {
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    chsh -s "$(command -v zsh)" 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "Oh My Zsh already installed."
  fi

  # Plugin installations - Enhanced method
  PLUGIN_BASE_DIR="$HOME/.oh-my-zsh/custom/plugins"
  mkdir -p "$PLUGIN_BASE_DIR"  # Ensure base directory exists

  git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGIN_BASE_DIR/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$PLUGIN_BASE_DIR/zsh-syntax-highlighting"

  # Powerlevel10k theme
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel10k
}

function setup_git_credential_manager {
    mkdir ~/pkgdown
    wget -P ~/pkgdown https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.deb
    dpkg -i ~/pkgdown/gcm-linux_amd64.2.0.785.deb
    apt-get install pass
    pass init "core pass store"
    git-credential-manager-core configure
}

function setup_miniconda() {
    wget -P ~/pkgdown https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash ~/pkgdown/Miniconda3-latest-Linux-x86_64.sh -b
    conda init zsh

    # Clean Up
    rm -r ~/pkgdown
}

function exit_error() {
  echo "$1. Check network connection and retry."
  exit 1
}

# --- Setup Prompts --- 
echo "This script will set up some dotfiles." 
echo "Continue? (y/n)"
read -r proceed
if [[ $proceed != "y" ]]; then
    exit 0
fi

# --- Main Execution ---
apt -y update && upgrade
check_package_manager  # Determine apt or yum (could be expanded)
install_packages
setup_zsh
setup_git_credential_manager
setup_miniconda

echo "Setup complete!" 
