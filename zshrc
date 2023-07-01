export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias update='sudo apt update && sudo apt upgrade -y'
alias git-done="git add . && git commit && git push"
alias git-update="git add . && git commit -mupdate && git push"
alias git-repeat="git add . && git commit -C HEAD@{1} && git push"
alias lg="lazygit"

alias clera="clear"
alias sl="ls"

#Copy the current folder to either desktop or porjects directory in windows
#to be used in WSL
function cpm(){
  cp -rfv $(pwd) /mnt/d/ibrahim/Projects
}

function cpd(){
  cp -rfv $(pwd) /mnt/c/Users/Ibrahim/Desktop
}

function openDocx(){
	doc2pdf -o /home/$USER/tmp/openDocx.pdf $1
	evince /home/$USER/tmp/openDocx.pdf
	rm /home/$USER/tmp/openDocx.pdf
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH="$HOME/.local/bin:$PATH" 
export EDITOR="nvim"


if [[ -f $HOME/.localrc ]] then
	source $HOME/.localrc
fi

LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS
