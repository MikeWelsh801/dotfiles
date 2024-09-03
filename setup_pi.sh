#!/bin/sh

curl -sS https://starship.rs/install.sh | sh
cp ./starship.toml ~/.config/starship.toml

sudo apt update
echo "setting up fish shell..."
sudo apt install fish
cp -a ./fish/. ~/.config/fish/
source ~/.config/fish/config.fish

echo "setting up neovim..."
sudo apt-get install git
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
rm -rf neovim

# setup neovim dependencies
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install bat

# setting up neovim config
cp -a ./nvim/. ~/.config/nvim/
fish
nvim
