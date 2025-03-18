#!/bin/bash

# スクリプトのディレクトリを取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# 入力ファイルのパスを設定
input_file="${SCRIPT_DIR}/dock-apps.plist"

# 入力ファイルが存在するか確認
if [ ! -f "$input_file" ]; then
    echo "エラー: $input_file が見つかりません。"
    echo "先に export-dock-apps.sh を実行して設定ファイルを作成してください。"
    exit 1
fi

# インポートするDock設定からアプリ名のリストを抽出して表示
echo "インポートする予定のDock固定アプリ一覧:"
echo "======================================"
# 旧形式plistからアプリ名を抽出
grep '"file-label" = ' "$input_file" | sed 's/.*"file-label" = \([^;]*\);.*/\1/'
echo "======================================"
echo ""

# 確認メッセージを表示
echo "警告: この操作は現在の Dock 設定を上書きします。"
read -p "続行しますか？ (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "操作をキャンセルしました。"
    exit 0
fi

# ファイルから Dock 設定を読み込み、適用
echo "Dock 設定をインポートしています..."
defaults write com.apple.dock persistent-apps -array "$(cat "$input_file")"

# Dock を再起動して変更を適用
echo "変更を適用するために Dock を再起動しています..."
killall Dock

echo "Dock 設定のインポートが完了しました。"
