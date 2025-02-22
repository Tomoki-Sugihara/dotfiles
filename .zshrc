# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(
    zsh-autosuggestions
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Alias for reloading zsh configuration
alias reload="source ~/.zshrc"
