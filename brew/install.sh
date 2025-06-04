#!/bin/bash

echo "🍺 Homebrew setup script"
echo "========================="
echo "Usage: ./install.sh [--no-upgrade | -n]"
echo "  --no-upgrade, -n: Skip upgrading packages when running brew bundle."
echo ""

# デフォルトのオプションを設定
BREW_BUNDLE_OPTIONS=""

# 引数をパースしてオプションを設定
while (( "$#" )); do
  case "$1" in
    --no-upgrade|-n)
      BREW_BUNDLE_OPTIONS="--no-upgrade"
      shift
      ;;
    *)
      echo "Error: Unknown option $1" >&2
      exit 1
      ;;
  esac
done

# Homebrewがインストールされているか確認
if ! command -v brew &> /dev/null; then
    echo "Homebrewをインストールします..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Homebrewのパスを設定（M1 Macの場合）
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Brewfile が存在する場合は bundle install を実行
if [ -f "$(dirname "$0")/Brewfile" ]; then
    echo "Brewfileからパッケージをインストールします..."
    if [ -n "$BREW_BUNDLE_OPTIONS" ]; then
        echo "Skipping package upgrades (--no-upgrade specified)."
        brew bundle --file="$(dirname "$0")/Brewfile" $BREW_BUNDLE_OPTIONS
    else
        brew bundle --file="$(dirname "$0")/Brewfile"
    fi
else
    echo "Brewfileが見つかりません。"
fi

echo "🎉 Homebrew setup completed!"
