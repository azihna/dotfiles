# activate zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $(echo $HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(echo $HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Setup powerline for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $(echo $HOME)/.oh-my-zsh/custom/themes/powerlevel10k

# install alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty

# install python
sudo apt-get install python3 
sudo apt-get install python3-pip
# for Neovim deoplete
pip3 install --upgrade msgpack==1.0.0
pip3 install --user jedi

# Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Install python3 neovim interface
sudo apt-get install python3-neovim

# Make sure a clipboard tool is installed
sudo apt-get install xclip

# Install tmux
sudo apt-get install tmux

# Install Stow
sudo apt-get install stow

