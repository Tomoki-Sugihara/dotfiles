#!/bin/bash

echo "🍺 Homebrew setup script"
echo "========================="

# Homebrewがインストールされているか確認
if ! command -v brew &> /dev/null; then
    echo "Homebrewをインストールします..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Homebrewのパスを設定（M1 Macの場合）
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrewはすでにインストールされています。アップデートします..."
    brew update
fi

# Brewfile が存在する場合は bundle install を実行
if [ -f "$(dirname "$0")/Brewfile" ]; then
    echo "Brewfileからパッケージをインストールします..."
    brew bundle --file="$(dirname "$0")/Brewfile"
else
    echo "Brewfileが見つかりません。"
fi

echo "🎉 Homebrew setup completed!"
