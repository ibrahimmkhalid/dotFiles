
## My dot files

*Note: Intended for systmes running Gnome 40+.*

### How to install
1. make an ssh key: `ssh-keygen -t ed25519 -C "ibrahimmkhalid@gmail.com"`
2. copy that key from the public key file, run `cat ~/.ssh/id_ed25519.pub`
3. add that key in GitHub Settings > SSH and GPG Keys > New SSH key
4. install git. on ubuntu, run `sudo apt update && sudo apt upgrade -y && sudo apt install git -y`
5. find a home for this repo and run `git clone git@github.com:ibrahimmkhalid/dotFiles.git`
6. cd into `dotFiles` and run the install scripts required

## Credits 
tmux-session script: https://github.com/mislav/dotfiles/blob/master/bin/tmux-session  
ts script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer  
install-gnome-extensions script: https://github.com/cyfrost/install-gnome-extensions  
ergogen: https://github.com/ergogen/ergogen  
qmk_firmware: https://github.com/qmk/qmk_firmware  
