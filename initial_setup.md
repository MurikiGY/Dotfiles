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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PS1="\[$(tput setaf 196)\]\u\[$(tput setaf 124)\]@\[$(tput setaf 87)\]\h \[$(tput setaf 13)\]\w \[$(tput sgr0)\]$ "

export LS_COLORS='di=1;36:fi=0;37:ln=1;35:pi=1;33:so=1;32:bd=1;34;46:cd=1;34;46:or=1;31:mi=0;31:ex=1;32:*.txt=0;35:*.jpg=0;33:*.png=0;33:*.sh=0;32:*.zip=0;36:*.tar=0;36:*.gz=0;36:*.bz2=0;36:'
```

## Yay AUR setup
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
```
