## My dot files

### Installer

Verified working on Ubuntu 24.04
Prepare for install:

```
sudo apt update -y && \
sudo apt install git ansible software-properties-common -y && \
git clone https://github.com/ibrahimmkhalid/dotFiles .dotFiles && \
cd .dotFiles
```

Do install (add required tags):

```
ansible-playbook local.yml --ask-become-pass --ask-vault-pass --skip-tags never --tags
```

Fix git remote after ssh keys installed

```
git remote remove origin && \
git remote add origin git@github.com:ibrahimmkhalid/dotFiles.git && \
git push --set-upstream origin main
```

List of availabe tags for ansible-playbook:

- meta tags
  - base
  - with-extra
  - with-gnome
  - clean (uninstall all the things)
  - never
  - always
- base tags (base)
  - git
  - nodejs (installs n package manager)
  - python (install uv package manager)
  - golang
  - nvim
  - scripts
  - ssh
  - tmux
  - zsh
- extra tags (with-extra)
  - lazygit
  - qmk
  - zathura
- gnome tags (with-gnome)
  - gnome-ext
  - gnome-settings
  - fonts

(There are many references to my username 'ibrahim'. If you are not me and want to use this repo, then make sure to go over all those changes)

## Credits

install-gnome-extensions script: https://github.com/ToasterUwU/install-gnome-extensions  
tmux-sessionizer script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer  
qmk_firmware: https://github.com/qmk/qmk_firmware  
n (node version manager): https://github.com/tj/n
uv (python package manager): https://github.com/astral-sh/uv
