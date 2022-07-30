#! /bin/env bash
# activate zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME"/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME"/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Setup powerline for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel10k

# install python
apt-get install python3 python3-pip

# Install neovim and stow
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
apt-get install neovim python3-neovim xclip stow

# Install system-control tools
apt-get install htop iotop lsof ncdu
