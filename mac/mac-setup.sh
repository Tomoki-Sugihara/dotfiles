#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

echo "macOS設定を適用します..."

# Bluetoothをメニューバーに表示
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# ネットワークボリュームで.DS_Storeファイルを作成しない
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finderウィンドウのタイトルにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finderで隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finderでパスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# Finderでステータスバーを表示
# defaults write com.apple.finder ShowStatusBar -bool true

# Finderでタブバーを表示
# defaults write com.apple.finder ShowTabView -bool true

# アプリケーション起動時の確認ダイアログを無効化
defaults write com.apple.LaunchServices LSQuarantine -bool false

# ライブ変換を無効化
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false

# メニューバーにバッテリー残量を表示
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# メニューバーに日付、曜日、時刻を表示
# defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# キーボードの初期遅延を設定
defaults write -g InitialKeyRepeat -int 15

# キーボードのリピート速度を設定
defaults write -g KeyRepeat -int 2

# マウス速度を設定
# defaults write -g com.apple.mouse.scaling 1.5

# Fnキーを標準機能キーとして使用
# defaults write -g com.apple.keyboard.fnState -bool true

# トラックパッド速度を設定
defaults write -g com.apple.trackpad.scaling 2

# すべての拡張子を表示
defaults write -g AppleShowAllExtensions -bool true

# ドックには固定化したアプリだけを表示 したがったが実行中アプリだけが表示になる
# defaults write com.apple.dock static-only -bool FALSE

# 起動音を無効化
sudo nvram StartupMute=%01

echo "設定を適用しています..."

# 変更を適用するためにアプリケーションを再起動
for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

echo "設定が完了しました。"