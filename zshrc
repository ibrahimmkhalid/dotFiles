export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source /usr/share/doc/fzf/examples/key-bindings.zsh
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^t "global-todo\n"
bindkey -s ^y "toggle-dark-mode\n"

alias update='sudo apt update && sudo apt upgrade -y'
alias git-done="git add . && git commit && git push"
alias git-update="git add . && git commit -mupdate && git push"
alias git-repeat="git add . && git commit -C HEAD@{1} && git push"
alias lg="lazygit"

alias clera="clear"
alias sl="ls"

# jupyter_ascending
alias jamb="python -m jupyter_ascending.scripts.make_pair --base"

function jaunsync() {
  # find all files with <name>.sync.ipynb
  ipynb_files=$(find . -maxdepth 1 -name "*.sync.ipynb")

  # go over both lists and remove the .sync from all files
  while read -r file; do
    mv $file ${file//.sync/}
  done <<< "$ipynb_files" 
}

function jasync() {
  # find all files with <name>.ipynb
  ipynb_files=$(find . -maxdepth 1 -name "*.ipynb")
  # go over both lists and add the .sync to all files
  while read -r file; do
    mv $file ${file//.ipynb/.sync.ipynb}
  done <<< "$ipynb_files" 
}

function jatopy() {
  if [ -z "$1" ]; then
    echo "Please provide a file name"
    return
  fi
  jupytext --to py:percent $1
}

alias nvim="nvim --listen /tmp/nvim.pipe"

export N_PREFIX="$HOME/.local/share/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

#Copy the current folder to either desktop or porjects directory in windows
#to be used in WSL
function cpm(){
  cp -rfv $(pwd) /mnt/d/ibrahim/Projects
}

function cpd(){
  cp -rfv $(pwd) /mnt/c/Users/Ibrahim/Desktop
}

function cph() {
  cp -rfv $(pwd) /home/ibrahim/tmp/
}

function openDocx(){
	doc2pdf -o /tmp/openDocx___1.pdf $1
	evince /tmp/openDocx___1.pdf
	rm /tmp/openDocx___1.pdf
}

export PATH="$HOME/.local/bin:$PATH" 
export EDITOR="nvim"

if [[ -f $HOME/.localrc ]] then
	source $HOME/.localrc
fi

if [[ -f .project_env ]]; then
  source .project_env
fi

LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# Turso
export PATH="$HOME/.turso:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"
