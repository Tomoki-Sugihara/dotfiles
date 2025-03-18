#!/bin/bash

# スクリプトのディレクトリを取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# 出力ファイルのパスを設定（スクリプトと同じディレクトリに）
output_file="${SCRIPT_DIR}/dock-apps.plist"

# Dockに固定されているアプリの詳細情報を保存（plist形式）
defaults read com.apple.dock persistent-apps > "$output_file"

echo "Dock固定アプリの設定を $output_file に保存しました。" 