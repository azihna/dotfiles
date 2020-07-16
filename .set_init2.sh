# solarized setup for terminal
sudo apt-get install fonts-powerline

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
