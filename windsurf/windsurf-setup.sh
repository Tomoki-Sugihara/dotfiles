SCRIPT_DIR=$(cd $(dirname $0) && pwd)
CURSOR_SETTING_DIR=~/Library/Application\ Support/Windsurf/User

# 最初のうちはcursorの設定ファイルを利用する

ln -s ~/dotfiles/cursor/settings.json ~/Library/Application\ Support/Windsurf/User/settings.json
ln -s ~/dotfiles/cursor/keybindings.json ~/Library/Application\ Support/Windsurf/User/keybindings.json

# TODO: Signature error出る
# install extension
cat ~/dotfiles/cursor/extensions | while read line
do
  code --force --install-extension $line
done