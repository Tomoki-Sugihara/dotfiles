# ---------------------------
# セットアップ
# ---------------------------
.PHONY : vscode cursor windsurf brew mac mise brew-bundle brew-dump all

cursor:
	chmod +x ./cursor/cursor-setup.sh
	./cursor/cursor-setup.sh

vscode:
	chmod +x ./cursor/vscode-setup.sh
	./cursor/vscode-setup.sh

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
