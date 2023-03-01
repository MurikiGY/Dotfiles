# Atualizacao de sistema
sudo pacman -Syyu

#instalação de sistema
sudo pacman -S --needed base-devel networkmanager dhcpcd speedtest-cli i3 i3status i3lock vim neovim alacritty pulseaudio alsa-utils picom

#instalacao de programas basicos
sudo pacman -S git valgrind gdb xclip unzip evince feh htop \
  ttf-nerd-fonts-symbols-1000-em noto-fonts-cjk noto-fonts-emoji noto-fonts \
  bash-completion

#instalação de programas adicionais
sudo pacman -S discord telegram-desktop spotify-launcher 

#Japanese Input
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-mocz fcitx5-qt fcitx5-gtk
#Add in /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
#Fcitx autostart
cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/
#Config the fcitx5-configtool after!!

#instalacao do yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

