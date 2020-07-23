apt update

# install vim
apt-get install vim

# install git
apt-get install git

# install zsh
apt-get install zsh

# install tmux
apt-get install tmux

# make zsh the default
chsh -s $(which zsh)

# download and install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
