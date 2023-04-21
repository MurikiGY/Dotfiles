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

## Mount the filesystem
``` bash
mount /dev/sda1 /mnt
mount --mkdir /dev/sda2 /mnt/home
```
In UEFI also mount boot
``` bash
mount --mkdir mount /dev/sda3 /mnt/boot/efi
```



# Issues:
1 - Can't update after a long time without updating\
solution: Update the keyring and then update the system: `sudo pacman -Sy archlinux-keyring` and then `sudo pacman -Su`

2 - if you run `sudo pip install ...` there will be packages that are not seen by pacman and then get update errors\
solution: `sudo pacman -Syu --overwrite "*"`

3 - Change a string in multiple files inside a directory\
solution: `sed -i 's/<old-string>/<new-string>/g' * <* stands for all files in the current directory`

4 - Debug C code with segfault\
solution: https://stackoverflow.com/questions/6545763/how-can-i-rerun-a-program-with-gdb-until-a-segmentation-fault-occurs
