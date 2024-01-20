# is not working as expected. will leave this branch up and someday come back to it?
## My dot files

Prepare for install:
```
sudo dnf update -y && \
sudo dnf install git ansible -y && \
git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && \
cd .dotFiles
git checkout fedora
```

Do install (add required tags):
```
ansible-playbook local.yml --ask-become-pass --ask-vault-pass --skip-tags never --tags 
```

List of availabe tags for ansible-playbook:
- meta tags
    - base
    - with-extra
    - with-gnome
    - clean (uninstall all the things)
    - never
    - always
    - fedora (must be mentioned)
- base tags (base)
    - git
    - nodejs (installs n package manager)
    - turso (installs turso cli tool)
    - golang
    - nvim
    - scripts
    - ssh
    - tmux
    - zsh
- extra tags (with-extra)
    - lazygit
    - qmk
    - ergogen (will install n as well)
- gnome tags (with-gnome)
    - gnome-ext
    - gnome-settings
    - fonts

## Credits 
tmux-session script: https://github.com/mislav/dotfiles/blob/master/bin/tmux-session  
install-gnome-extensions script: https://github.com/ToasterUwU/install-gnome-extensions  
tmux-sessionizer script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer  
ergogen: https://github.com/ergogen/ergogen  
qmk_firmware: https://github.com/qmk/qmk_firmware  
n (node version manager): https://github.com/tj/n

ansible-playbook local.yml --ask-become-pass --vault-pass-file ./vaultpass.txt --skip-tags never,nvim,tmux,zsh --tags base
