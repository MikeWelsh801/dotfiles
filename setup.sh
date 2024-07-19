#!/bin/sh

curl -sS https://starship.rs/install.sh | sh
cp ./starship.toml ~/.config/starship.toml

sudo apt update
echo "setting up fish shell..."
sudo apt install fish
cp -a ./fish/. ~/.config/fish/
source ~/.config/fish/config.fish

echo "setting up neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
# exracting app image and making it accessable
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm -rf ./squashfs-root/
rm ./nvim.appimage

# setting up neovim config
cp -a ./nvim/. ~/.config/nvim/
nvim
