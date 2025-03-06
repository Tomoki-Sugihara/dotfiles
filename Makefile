# ---------------------------
# セットアップ
# ---------------------------
.PHONY : init vscode cursor windsurf brew mac mise brew-bundle brew-dump all

init:
	ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

vscode:
	ln -s ~/dotfiles/vscode/setting.json ~/Library/Application\ Support/Cursor/User/settings.json

cursor:
	./cursor/cursor-setup.sh

windsurf:
	./windsurf/windsurf-setup.sh

brew:
	./brew/install.sh

mac:
	chmod +x ./mac/mac-setup.sh
	./mac/mac-setup.sh

mise:
	./mise/setup-mise.sh

# ---------------------------
# その他
# ---------------------------
.PHONY: export-cursor-extensions

export-cursor-extensions:
	cursor --list-extensions > ./cursor/extensions
