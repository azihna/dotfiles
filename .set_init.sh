sudo apt update

# install vim
sudo apt-get install vim

# install git
sudo apt-get install git

# install zsh
sudo apt-get install zsh

# install tmux
sudo apt-get install tmux

# make zsh the default
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

