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

export N_PREFIX="$HOME/.local/share/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

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

export PATH="$HOME/.local/bin:$PATH" 
export EDITOR="nvim"

if [[ -f $HOME/.localrc ]] then
	source $HOME/.localrc
fi

LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS
