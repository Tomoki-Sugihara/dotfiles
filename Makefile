init:
	ln -s ~/dotfiles/.zshrc ~/.zshrc

vscode:
	ln -s ~/dotfiles/vscode/setting.json ~/Library/Application\ Support/Cursor/User/settings.json

export-cursor-extensions:
	cursor --list-extensions > ./cursor/extensions