
## My dot files

*Note: Intended for apt based systmes running Gnome 40.*

### How to install
1. make an ssh key: `ssh-keygen -t ed25519 -C "ibrahimmkhalid@gmail.com"`
2. add that key in GitHub Settings > SSH and GPG Keys > New SSH key
3. run `sudo apt update && sudo apt upgrade -y && sudo apt install git -y`
4. find a home for this repo and run `git clone git@github.com:ibrahimmkhalid/dotFiles.git`
5. cd into `dotFiles` and run `./install.sh`

Grocerapp laradock config from: https://github.com/ibrahimmkhalid/grocerapp-laradock

## Credits 
tmux: https://github.com/gpakosz/.tmux.git  
nvim: https://github.com/AstroNvim/AstroNvim  
tmux-session: https://github.com/mislav/dotfiles/blob/master/bin/tmux-session  
