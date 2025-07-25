# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# If is MacOS
if [[ $OSTYPE == 'darwin'* ]]; then
	# Add homebrew to path
	export PATH=$PATH:/opt/homebrew/bin 
	#Add mysql to PATH
	export PATH=${PATH}:/usr/local/mysql/bin

	### Love (lua game engine) Aliases
	alias love="/Applications/love.app/Contents/MacOS/love"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Old theme: bira
ZSH_THEME="awesomepanda"

# SETUP BARE DOTFILES REPO
alias config="/usr/bin/git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# PLUGINS SETUP
# If is MacOS
if [[ $OSTYPE == 'darwin'* ]]; then
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# FZF SETUP
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# Python setup
eval "$(pyenv init --path)"

# SOURCE MY ALIASES
source $HOME/.aliases

# REMAP SUGGESTION ACCEPT
bindkey '^y' end-of-line

# Load Angular CLI autocompletion.
source <(ng completion script)

# SET TMUX SESSIONIZER AND WINDOWNIZER BINDINGS
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^w "tmux-windownizer\n"

# COMMANDS
export PATH=$(find $HOME/.scripts -type d | paste -sd ":" -):$PATH
export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
