# Arch-Setup

## Verify boot mode
Check if the /sys/firmware/efi/efivars file exists.
If it exists then the instalation will be for UEFI, otherwise BIOS.

## Internet connection
``` bash
iwctl
station list
station <device> scan
station <devide> get-networks
station <device> connect <connetion>
```
Checl the internet connection with `ping google.com`

## Partition the disks
In BIOS:
- /dev/sda1   # Root
- /dev/sda2   # Home

In UEFI
- /dev/sda1   # Root
- /dev/sda2   # Home
- /dev/sda3   # Boot

## Format partitions
``` bash
mkfs.ext4 </dev/sda*>
```
For boot partition
``` bash
mkfs.fat -F32 </dev/sda*>
```

## Mount the filesystem
``` bash
mount /dev/sda1 /mnt
mount --mkdir /dev/sda2 /mnt/home
```
In UEFI also mount boot
``` bash
mount --mkdir mount /dev/sda3 /mnt/boot/efi
```

## Install essential packages
``` bash
pacstrap -K /mnt base linux linux-firmware vim iwd dhcpcd
```

## Fstab
``` bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## Change root
Enter the new system
``` bash
arch-chroot /mnt
```

## Timezone
```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```

## Localization
Edit `/etc/locale.gen` and uncomment the locales
``` bash
locale-gen
```
Add `LANG=pt_BR.UTF-8` in `/etc/locale.conf` and `KEYMAP=br-ABNT2` in `/etc/vconsole.conf`

## Hostname
Add `<myhostname>` in `/etc/hostname`

## Initramfs
``` bash
mkinitcpio -P
```

## Root Password
``` bash
passwd
```

## Create a user
``` bash
useradd -m -g users -G wheel,storage,power -s /bin/bash username
passwd username
```

## Bootloader with GRUB
### For BIOS
Install GRUB
``` bash
pacman -S grub
grub-install -target=i386-pc --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```
### For UEFI
install GRUB
``` bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```
Now reboot and pray.

And then login as the new user

## Internet connection
Start and enable dhcpcd and iwd
``` bash
systemctl enable dhcpcd
systemctl enable iwd
systemctl start dhcpcd
systemctl start iwd
```

## Graphical interface with I3
Install xorg
``` bash
pacman -S xorg xorg-xinit
```
Install I3
``` bash
pacman -S i3 i3status i3lock
```
Create the file `~/.xinitrc` if not exists
``` bash
echo "exec i3" >> ~/.xinitrc
```
And finally start the I3 interface with `startx`


# Issues:
1 - Can't update after a long time without updating\
solution: Update the keyring and then update the system: `sudo pacman -Sy archlinux-keyring` and then `sudo pacman -Su`

2 - if you run `sudo pip install ...` there will be packages that are not seen by pacman and then get update errors\
solution: `sudo pacman -Syu --overwrite "*"`

3 - Change a string in multiple files inside a directory\
solution: `sed -i 's/<old-string>/<new-string>/g' * <* stands for all files in the current directory`

4 - Debug C code with segfault\
solution: https://stackoverflow.com/questions/6545763/how-can-i-rerun-a-program-with-gdb-until-a-segmentation-fault-occurs
