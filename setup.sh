#!/bin/sh

curl -sS https://starship.rs/install.sh | sh
cp ./starship.toml ~/.config/starship.toml

sudo apt update
echo "setting up fish shell..."
sudo apt install fish
cp -a ./fish/. ~/.config/fish/
source ~/.config/fish/config.fish

echo "setting up neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
# exracting app image and making it accessable
./nvim-linux-x86_64.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm -rf ./squashfs-root/
rm ./nvim-linux-x86_64.appimage

# setup neovim dependencies
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install bat

# setting up neovim config
cp -a ./nvim/. ~/.config/nvim/
fish
# nvim
