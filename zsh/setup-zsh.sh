#!/bin/bash

# シンボリックリンクの作成
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

# oh-my-zshのインストール
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# auto-suggestionsのインストール (参考 https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
