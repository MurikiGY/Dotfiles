## I3 basic program
```bash
# System update
sudo pacman -Syyuu

# Programs
sudo pacman -S \
  xorg xorg-xinit i3 i3status i3lock i3block \
  arandr autorandr dmenu picom \
  feh ksnip sxiv
```

## add to .xinitrc
Default location: `/etc/X11/xinit/xinitrc`
```bash
xrandr --output HDMI-1 --right-of HDMI-2

setxkbmap -model abnt2 -layout br
setxkbmap -option caps:escape

# Wallpaper on init - Must first call
# $>feh --bg-scale image.file
./.fehbg
# Disable beep
xset b off

exec i3
```

## Copy configuration files
```bash
cp ./config/i3/config               ~/.config/i3/
cp ./config/scripts                 ~/.config/
cp ./config/i3blocks/i3blocks.conf  ~/.config/i3blocks/
cp ./config/i3status/config         ~/.config/i3status/
cp ./config/picom/picom.conf        ~/.config/picom/
```

## libinput
```bash
# Config for touchpad
cp ./libinput/40-libinput.conf /etc/X11/xorg.conf.d/
```
