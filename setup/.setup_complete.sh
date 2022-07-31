#! /bin/env bash
# activate zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME"/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME"/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Setup powerline for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel10k

# install python
apt-get install python3 python3-pip libicu-dev

# Install neovim and stow
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim python3-neovim xclip stow

# Install system-control tools
apt-get install htop iotop lsof ncdu

# Install git credential manager for gpg
mkdir ~/pkgdown
wget -P ~/pkgdown https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.deb
dpkg -i ~/pkgdown/gcm-linux_amd64.2.0.785.deb
apt-get install pass
pass init "core pass store"
git-credential-manager-core configure

# Download install and initial miniconda
wget -P ~/pkgdown https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/pkgdown/Miniconda3-latest-Linux-x86_64.sh
conda init zsh

# Clean up the packages
rm -r ~/pkgdown
