
## My dot files

WSL/terminal only install:
```
sudo apt update -y && sudo apt install git ansible software-properties-common -y && git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && cd .dotFiles && ansible-playbook local.yml --ask-become-pass --ask-vault-pass -t shell
```

Gnome install:
```
sudo apt update -y && sudo apt install git ansible software-properties-common -y && git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && cd .dotFiles && ansible-playbook local.yml --ask-become-pass --ask-vault-pass -t gnome
```

## Credits 
tmux-session script: https://github.com/mislav/dotfiles/blob/master/bin/tmux-session  
install-gnome-extensions script: https://github.com/ToasterUwU/install-gnome-extensions  
tmux-sessionizer script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer  
ergogen: https://github.com/ergogen/ergogen  
qmk_firmware: https://github.com/qmk/qmk_firmware  
