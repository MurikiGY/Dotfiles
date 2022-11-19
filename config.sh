# Atualizacao de sistema
sudo pacman -Syuu

#instalacao de programas
sudo pacman -S --needed base-devel git discord telegram vim docker alacritty spotify-launcher

#Instalacao do paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

#instalacao do yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

#configuracao do vim
mkdir ~/.vim
cp vimrc ~/.vim/

#configuracao do alacritty
cp alacritty.yml ~/.config/
