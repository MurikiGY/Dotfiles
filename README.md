# Arch-Setup
Here I save my setup instalations and personalizations.

# Issues:
1 - Can't update after a long time without updating\
solution: Update the keyring and then update the system: `sudo pacman -Sy archlinux-keyring` and then `sudo pacman -Su`

2 - if you run `sudo pip install ...` there will be packages that are not seen by pacman and then get update errors\
solution: `sudo pacman -Syu --overwrite "*"`

3 - Change a string in multiple files inside a directory\
solution: `sed -i 's/<old-string>/<new-string>/g' * <* stands for all files in the current directory`

4 - Debug C code with segfault\
solution: https://stackoverflow.com/questions/6545763/how-can-i-rerun-a-program-with-gdb-until-a-segmentation-fault-occurs
