## Additional programs
```bash
# System update
sudo pacman -Syyuu

# Programs
sudo pacman -S discord telegram-desktop spotify-launcher steam firefox
```

## Bluetooth
```bash
sudo pacman -S bluez bluez-utils
modprobe btusb
systemctl start Bluetooth
```

## Japanese Input
```bash
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-mozc fcitx5-qt fcitx5-gtk
#Add in /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
#Fcitx autostart
cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/
#Config the fcitx5-configtool after!!
```
