
## My dot files

*Note: Intended for systmes running Gnome 40+.*

### How to install
1. make an ssh key: `ssh-keygen -t ed25519 -C "ibrahimmkhalid@gmail.com"`
2. add that key in GitHub Settings > SSH and GPG Keys > New SSH key
3. run `sudo apt update && sudo apt upgrade -y && sudo apt install git -y`
4. find a home for this repo and run `git clone git@github.com:ibrahimmkhalid/dotFiles.git`
5. cd into `dotFiles` and run `./install.sh`

## Credits 
tmux-session script: https://github.com/mislav/dotfiles/blob/master/bin/tmux-session  
install-gnome-extensions script: https://github.com/cyfrost/install-gnome-extensions  
ergogen: https://github.com/ergogen/ergogen  
qmk_firmware: https://github.com/qmk/qmk_firmware  
