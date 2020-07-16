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

# solarized setup for terminal
sudo apt-get install fonts-powerline
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git /home/alihan/.solarized

# activate zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions /home/alihan/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty

# install python
sudo apt-get install python3 
sudo apt-get install python3-pip
# for Neovim deoplete
pip3 install --upgrade msgpack==1.0.0

# Install neovim
sudo apt-get install neovim

# Install tmux
sudo apt-get install tmux

# Install Stow
sudo apt-get install stow
