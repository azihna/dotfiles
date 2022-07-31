#! /bin/env bash
apt update

apt install wget
apt-get install vim zsh wget curl

# make zsh the default
chsh -s "$(command -v zsh)"

# download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
