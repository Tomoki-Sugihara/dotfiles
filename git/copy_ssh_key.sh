#!/bin/bash

# このスクリプトの生成プロンプト：
# 「macOS環境でSSH鍵がなければ作成し、公開鍵をクリップボードにコピーするスクリプトを作成してください。
# 鍵が存在するかチェックし、なければGitHubアカウント用のメールアドレスを入力させて鍵を生成します。
# 最後にGitHubへの公開鍵追加手順を表示してください。macOS以外の環境ではエラーを表示して終了します。」

# macOSかどうかを確認
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "このスクリプトはmacOSでのみ動作します。"
  exit 1
fi

# SSHディレクトリが存在しない場合は作成
if [ ! -d "$HOME/.ssh" ]; then
  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"
fi

# id_ed25519鍵が存在するか確認
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "SSH鍵が見つかりません。新しい鍵を生成します..."
  
  # メールアドレスの入力を求める
  read -p "GitHubアカウントのメールアドレスを入力してください: " email
  
  # SSH鍵を生成（パスフレーズなし）
  ssh-keygen -t ed25519 -C "$email" -f "$HOME/.ssh/id_ed25519" -N ""
  
  echo "SSH鍵が生成されました。"
else
  echo "既存のSSH鍵が見つかりました。"
fi

# SSHエージェントを起動して鍵を追加
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"

# 公開鍵をクリップボードにコピー
cat "$HOME/.ssh/id_ed25519.pub" | pbcopy
echo "公開鍵がクリップボードにコピーされました。"

echo ""
echo "この公開鍵をGitHubアカウントに追加してください："
echo "1. GitHubにログイン"
echo "2. 右上のプロフィールアイコン → Settings"
echo "3. 左側のメニューから「SSH and GPG keys」を選択"
echo "4. 「New SSH key」ボタンをクリック"
echo "5. タイトルを入力し、keyTypeは「Authentication key（認証キー）」を選択し、コピーした公開鍵を貼り付け"
echo "6. 「Add SSH key」ボタンをクリック"
