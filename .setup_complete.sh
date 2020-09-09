# activate zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $(echo $HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(echo $HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Setup powerline for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $(echo $HOME)/.oh-my-zsh/custom/themes/powerlevel10k

# install alacritty
add-apt-repository ppa:mmstick76/alacritty
apt update
apt install alacritty

# install python
apt-get install python3 
apt-get install python3-pip
# for Neovim deoplete
pip3 install --upgrade msgpack==1.0.0
pip3 install --user jedi

# Install neovim
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim

# Install python3 neovim interface
apt-get install python3-neovim

# Make sure a clipboard tool is installed
apt-get install xclip

# Install tmux
apt-get install tmux

# Install Stow
apt-get install stow
