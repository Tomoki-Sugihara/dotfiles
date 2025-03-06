export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# miseの有効化
eval "$(mise activate zsh)"

# miseの設定ファイルの指定
export MISE_CONFIG_FILE=~/dotfiles/mise/mise.toml

# Added by Windsurf
export PATH="/Users/sugiharatomoki/.codeium/windsurf/bin:$PATH"

# エイリアスの設定
alias reload="source ~/.zshrc"
alias cs="cursor"
alias ws="windsurf"
