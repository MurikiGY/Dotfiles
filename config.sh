# Atualizacao de sistema
sudo pacman -Syyu

#instalação de sistema
sudo pacman -S networkmanager dhcpcd speedtest-cli i3 i3status i3lock vim neovim alacritty pulseaudio picom

#instalacao de programas basicos
sudo pacman -S git valgrind gdb xclip unzip evince feh htop \
  ttf-nerd-fonts-symbols-1000-em noto-fonts-cjk noto-fonts-emoji noto-fonts \
  bash-completion

#instalação de programas adicionais
sudo pacman -S discord telegram-desktop spotify-launcher 

#instalacao do yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

