## System basic
```bash
# System update
sudo pacman -Syyuu

# System basic
sudo pacman -S base-devel        \
  dhcpcd iwd speedtest-cli wget  \
  git rsync openssh unzip evince \
  playerctl brightnessctl        \
  python-virtualenv python-pip   \
  vim neovim alacritty tmux htop bash-completion pacman-contrib \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack alsa-utils \
  ttf-nerd-fonts-symbols noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-font-awesome
```

## Basic setup
```bash
# Alacritty - https://github.com/alacritty/alacritty-theme
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
cp ./config/alacritty/alacritty.toml ~/.config/alacritty/
```

## Bashrc
```bash
# SSH
alias agent='eval $(ssh-agent) && ssh-add ~/.ssh/id_ed25519'
```

## Yay AUR setup
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
```
