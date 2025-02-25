init:
	ln -s ~/dotfiles/.zshrc ~/.zshrc

vscode:
	ln -s ~/dotfiles/vscode/setting.json ~/Library/Application\ Support/Cursor/User/settings.json

export-cursor-extensions:
	cursor --list-extensions > ./cursor/extensions

# Homebrewのセットアップとパッケージのインストール
brew:
	chmod +x ./brew/install.sh
	./brew/install.sh

# Brewfileからパッケージをインストール
brew-bundle:
	brew bundle --file=./brew/Brewfile

# 現在インストールされているパッケージをBrewfileにエクスポート
brew-dump:
	brew bundle dump --force --file=./brew/Brewfile

# すべてのセットアップを実行
all: init vscode brew