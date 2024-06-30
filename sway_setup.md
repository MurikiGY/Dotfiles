## Sway basic program
Sway wiki programs: https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway

```bash
# System update
sudo pacman -Syyuu

# Programs
sudo pacman -S sway swayidle swaylock swaybg \
  imv wofi waybar xorg-xwayland

yay -S wdisplay sway-screenshot
```

## Add to .bash_profile
```bash
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi

export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock
```

## Copy the files in config to .config/sway/config
```bash
cp ./config/sway/config ~/.config/sway/
cp ./config/wofi/style.css ~/.config/wofi/
cp ./config/waybar/style.css ~/.config/waybar/
```
x
