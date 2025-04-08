SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User


ln -s ~/dotfiles/cursor/settings.json "/Users/sugiharatomoki/Library/Application Support/Code/User/settings.json"
ln -s ~/dotfiles/cursor/keybindings.json "/Users/sugiharatomoki/Library/Application Support/Code/User/keybindings.json"

# install extension
cat ~/dotfiles/cursor/extensions | while read line
do
  code --force --install-extension $line
done