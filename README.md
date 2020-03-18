# wsl-helper
A bash script that adds new commands to help transferring files between WSL and the normal Windows system

## Setup:
1. In helper.sh, first change base_dir to your preferred directory on you local system, e.g. /mnt/c/Users/{your Windows username}/Desktop/WSL to set the a folder named "WSL" on your desktop as you base directory.

2. Move helper.sh to you home directory on WSL, "cd ~". 

3. Rename "helper.sh" to ".helper.sh" to make it a hidden file, "mv helper.sh .helper.sh".

4. Edit ~/.bashrc with your preferred text editor and append "source ~/.helper.sh" to the file (without the quotes).

## Commands:
#### base
Will change the current directory to base_dir.

#### mirror
Returns the current directory's mirror director.

For example, say base_dir=/mnt/c/Users/aevan/Desktop/WSL. If the current directory is ~/random, then mirror will return /mnt/c/Users/aevan/Desktop/WSL/random. If the current directory is /mnt/c/Users/aevan/Desktop/WSL/test, then mirror will return ~/test.

#### warp
Changes the current directory to its mirrored directory.

For example, if base_dir=/mnt/c/Users/aevan/Desktop/WSL and the current directory is ~/random, then warp will change the current directory to /mnt/c/Users/aevan/Desktop/WSL/random, creating new folders as needed.

#### relay
Copies all specified files in the current direcory to the mirrored directory.

For example, say base_dir=/mnt/c/Users/aevan/Desktop/WSL and the current directory is ~/random. Let ~/random contain a file, "file.out", and an arbitrary directory. The command "relay file.out" will copy ~/random/file.out to /mnt/c/Users/aevan/Desktop/WSL/random and the command "relay -r \*" will copy all files and directories in ~/random to /mnt/c/Users/aevan/Desktop/WSL/random.
