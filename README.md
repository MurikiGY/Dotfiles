# Muriki Arch Setup

## Good tutorial for i3 customization
https://itsfoss.com/i3-customization/

## Discord for wayland
https://lemmy.ml/post/1557630

## Text editor setup
Based in ThePrimeagen Packer setup  
Run:  
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Move the `nvim` directory to `~.config/` and rename `~/.config/nvim/after` to `~/.config/nvim/tmp`  
Open the file `~/.config/nvim/lua/mysettings/packer.lua` with nvim and run:
```
:so
:PackerSync
```

Finally rename `~/.config/nvim/tmp` to `~/.config/nvim/after`  
- plugins can be installed by adding them in `~/.config/nvim/lua/mysettings/packer.lua`  
- Additional config of the plugins can be added in `~/.config/nvim/after/plugin/plugin-name.file`  
- keyboard keymap in `~/.config/nvim/lua/mysettings/remap.lua`  
- Editor settings in `~/.config/nvim/lua/mysettings/set.lua`  

# Arch Linux
Based on Diolinux: https://diolinux.com.br/sistemas-operacionais/arch-linux/como-instalar-arch-linux-tutorial-iniciantes.html

## !!! BIOS CHECK !!!
Verify if the options:
- RST is disabled
- Secure Boot is disabled
- AHCI is set instead of RAID


## Verify boot mode
Check if the /sys/firmware/efi/efivars file exists.  
If it exists then the instalation will be for UEFI, otherwise BIOS.  

## Internet connection
```bash
iwctl
station list
station <device> scan
station <device> get-networks
station <device> connect <connetion>
```
Check the internet connection with `ping google.com`

## Partition the disks
In BIOS:  
- /dev/sda1   # Root  
- /dev/sda2   # Home  

In UEFI  
- /dev/sda1   # Root  
- /dev/sda2   # Home  
- /dev/sda3   # Boot  

## Format partitions
```bash
# Root and home
mkfs.ext4 </dev/sda*>
# Boot
mkfs.fat -F32 </dev/sda*>
```

## Mount the filesystem
```bash
# Root and home
mount /dev/sda1 /mnt
mount --mkdir /dev/sda2 /mnt/home
# If using EFI also mount boot
mount --mkdir /dev/sda3 /mnt/boot/efi
```

## Install essential packages
```bash
# Scrach system install
pacstrap -K /mnt base linux linux-firmware vim iwd dhcpcd
# Fstab for mounting partitions
genfstab -U -p /mnt >> /mnt/etc/fstab
# Enter the new system as root
arch-chroot /mnt
```

## Basic setup
```bash
# Timezone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
# Localization
# Uncomment the line pt_BR.UTF-8 in /etc/locale.gen
locale-gen
# locale config
echo LANG=pt_BR.UTF-8 >> /etc/locale.conf
# Keyboard
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf
# Hostname
echo thehostnameilike >> /etc/hostname
```

## Initramfs
```bash
mkinitcpio -P
```

## Root and User password
```bash
# Root password
passwd
# Create new user and set password
useradd -m -g users -G wheel,storage,power -s /bin/bash theusernameilike
passwd theusernameilike
```

## Bootloader with GRUB
Now make sure to known if you are using BIOS Legacy or EFI

### For BIOS
```bash
pacman -S grub
grub-install --target=i386-pc --recheck /dev/sda --force
grub-mkconfig -o /boot/grub/grub.cfg
```

### For UEFI
```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```
Now reboot and pray.

And then login as the user you created

## Internet connection
Start and enable dhcpcd and iwd
```bash
systemctl enable dhcpcd
systemctl enable iwd
systemctl start dhcpcd
systemctl start iwd
```
#### 8021x Networks
Create a file as root in /var/lib/iwd/mywifiname.8021x  
```config
[Security]
EAP-Method=TTLS
EAP-Identity=myusername
EAP-TTLS-Phase2-Method=Tunneled-PAP
EAP-TTLS-Phase2-Identity=myusername
EAP-TTLS-Phase2-Password=thepasswordformyusername

[Settings]
AutoConnect=true
```

## Update clock/date/locale
```bash
timedatectl set-ntp true
localectl set-locale LANG=pg_BR.UTF-8
localectl set-keymap --no-convert bt-abnt2
```

## Mirrors
Update the pacman mirrors to improve pacman
```config
Server = https://archlinux.c3sl.ufpr.br/$repo/os/$arch
```

## Graphical interface
Check the files `i3_setup.md` and `sway_setup.md`

## Firefox
#### Compact mode
about:config -> browser.compactmode.show -> set true -> customize toolbar -> Density -> Compact

#### Screenshot
customize toolbar -> add screenshot


# Usual system problems and solutions
1 - Can't update arch after a long time without updating  
solution: Update the keyring and then update the system: `sudo pacman -Sy archlinux-keyring` and then `sudo pacman -Su`

2 - Packages not seen by pacman  
If you run `sudo pip install ...` there will be packages that are not seen by pacman and then get update errors\
solution: `sudo pacman -Syu --overwrite "*"`

3 - Change a string in multiple files inside a directory  
solution: `sed -i 's/<old-string>/<new-string>/g' * <* stands for all files in the current directory`

4 - Debug C code with segfault  
solution: https://stackoverflow.com/questions/6545763/how-can-i-rerun-a-program-with-gdb-until-a-segmentation-fault-occurs

5 - Bash execution output in stdout and file  
Solution: `program [arguments...] 2>&1 | tee outfile`

6 - Find file in subdirectories  
Solution: `find /<directory> -name <file>`\
Example: `find /usr -name likwid*`

7 - Prompt colors:  
Solution: https://robotmoon.com/bash-prompt-generator/

8 - Print file based on file data:  
Solution: https://unix.stackexchange.com/questions/206556/extracting-lines-based-on-conditions

9 - Update latest version of pip:  
solution: `python3 pip install -U pip`

10 - Python matplotlib bad formatation:  
solution: https://www.pythoncharts.com/matplotlib/rotating-axis-labels/

11 - Show lines in file that aren't in another file:  
solution: diff temp1 temp2 | grep "<" | sed 's/< //'

12 - Update time clock:  
solution: https://unix.stackexchange.com/questions/60772/i-messed-up-my-system-clock-in-arch-linux

13 - Virtualenv with different python version:  
solution: https://stackoverflow.com/questions/1534210/use-different-python-version-with-virtualenv

14 - Find patterns in files:  
solution: https://stackoverflow.com/questions/16956810/how-to-find-all-files-containing-specific-text-string-on-linux

15 - LSP not findind library symbols:  
solution: https://www.reddit.com/r/neovim/comments/qt6565/lsp_pyright_cannot_access_member/?rdt=42439

16 - Show lines in file1 that are not in another file2:  
Solution: grep -vwf file2 file1

17 - Call python function from command line with parameters:  
Solution: https://stackoverflow.com/questions/3987041/run-function-from-the-command-line


