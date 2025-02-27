#!/bin/bash

# miseがインストールされているか確認
if ! command -v mise &> /dev/null; then
    echo "miseがインストールされていません。 brew install mise でmiseをインストールしてください。"
    exit 1
fi

# Nodeの最新LTS版をインストール
echo "Node.jsの最新LTS版をインストールします..."
mise use --global node@lts

# インストールの確認
echo "インストールされたNodeのバージョン:"
mise exec node -- node --version

echo "インストールされたnpmのバージョン:"
mise exec node -- npm --version

echo "セットアップが完了しました！"
