
## My dot files

Base install only (ssh, zsh, tmux, nvim, etc):
```
sudo apt update -y && \
sudo apt install git ansible software-properties-common -y && \
git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && \
cd .dotFiles && \
ansible-playbook local.yml --ask-become-pass --ask-vault-pass --skip-tags never --tags base
```

Regular install (base + ergogen, qmk, lazygit):
```
sudo apt update -y && \
sudo apt install git ansible software-properties-common -y && \
git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && \
cd .dotFiles && \
ansible-playbook local.yml --ask-become-pass --ask-vault-pass --skip-tags never --tags base,with-extra
```

Full install (regular + gnome configs):
```
sudo apt update -y && \
sudo apt install git ansible software-properties-common -y && \
git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && \
cd .dotFiles && \
ansible-playbook local.yml --ask-become-pass --ask-vault-pass --skip-tags never --tags base,with-extra,with-gnome
```

## Credits 
tmux-session script: https://github.com/mislav/dotfiles/blob/master/bin/tmux-session  
install-gnome-extensions script: https://github.com/ToasterUwU/install-gnome-extensions  
tmux-sessionizer script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer  
ergogen: https://github.com/ergogen/ergogen  
qmk_firmware: https://github.com/qmk/qmk_firmware  
