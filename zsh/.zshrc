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

# 環境変数読み込み
if [ -f ~/dotfiles/zsh/.env ]; then
  export $(cat ~/dotfiles/zsh/.env | xargs)
fi

# エイリアスの設定
alias reload="source ~/.zshrc"
alias cs="cursor"
alias ws="windsurf"

# Obsidian コマンド
obs() {
  deno run --allow-read --allow-write --allow-run --allow-env ~/dotfiles/obsidian/cli.ts "$@"
}

clauded () {
  # 第一引数があれば -p に含める
  if [ -n "$1" ]; then
    claude --dangerously-skip-permissions -p "$1"
  else
    claude --dangerously-skip-permissions
  fi
}

# 不明
. "$HOME/.local/bin/env"

cds() {
  if [ -z "$1" ]; then
    echo "Usage: cds <project_name>"
    return 1
  fi

  mkdir "$1"
  cd "$1"
  
  if [ "$2" = "-r" ]; then
    cursor -r .
  else
    cursor .
  fi
}

clonecs() {
  git clone $1
  cursor -r .
}