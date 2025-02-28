#!/bin/bash

# miseがインストールされているか確認
if ! command -v mise &> /dev/null; then
    echo "miseがインストールされていません。 `brew install mise` でmiseをインストールしてください。"
    exit 1
fi

# シンボリックリンクを作成（存在しない場合のみ）
if [ ! -L ~/.config/mise/config.toml ]; then
    # 設定ディレクトリが存在しない場合は作成
    mkdir -p ~/.config/mise
    echo "mise.tomlのシンボリックリンクを作成します..."
    ln -sf ~/dotfiles/mise.toml ~/.config/mise/config.toml
else
    echo "mise.tomlのシンボリックリンクは既に存在します。"
fi

# mise.tomlの内容を一括でインストール
echo "mise.tomlの設定に基づいてツールをインストールしています..."
mise install

# インストールされたツールのバージョンを確認
echo "インストールされたツールのバージョン一覧:"
mise list
\

echo "セットアップが完了しました！"
