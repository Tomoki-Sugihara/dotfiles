SCRIPT_DIR=$(cd $(dirname $0) && pwd)
CURSOR_SETTING_DIR=~/Library/Application\ Support/Cursor/User


ln -s ~/dotfiles/cursor/settings.json ${CURSOR_SETTING_DIR}/settings.json
ln -s ~/dotfiles/cursor/keybindings.json ${CURSOR_SETTING_DIR}/keybindings.jsons

# TODO: Signature error出る
# install extension
cat ~/dotfiles/cursor/extensions | while read line
do
  cursor --force --install-extension $line
done