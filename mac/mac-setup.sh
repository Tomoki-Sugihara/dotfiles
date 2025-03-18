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

# スクリーンショットの保存先を設定
# 注意: 現在は未設定ですが、必要に応じてコメントを解除してください
# defaults write com.apple.screencapture location ~/Pictures/Screenshots
# mkdir -p ~/Pictures/Screenshots

# スクリーンショットの影を無効化
# 注意: 現在は未設定ですが、必要に応じてコメントを解除してください
# defaults write com.apple.screencapture disable-shadow -bool true

# スクリーンショットのフォーマットを設定（png, jpg, pdf, tiff）
# 注意: 現在は未設定ですが、必要に応じてコメントを解除してください
# defaults write com.apple.screencapture type -string "png"

# Dockのサイズを設定（現在の値：39）
defaults write com.apple.dock tilesize -int 39

# Dockの拡大機能を有効化
defaults write com.apple.dock magnification -bool true
# Dockの拡大サイズを設定（現在の値：56）
defaults write com.apple.dock largesize -int 56

# Dockの位置を設定（left, bottom, right）
defaults write com.apple.dock orientation -string "bottom"

# ミッションコントロールの設定
defaults write com.apple.dock expose-animation-duration -float 0.1

# Spotlightのショートカットを無効化
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 0; value = {parameters = (65535, 49, 1048576); type = standard; }; }"

# システム環境設定 > セキュリティとプライバシー > 一般 > スリープとスクリーンセーバの解除にパスワードを要求（秒数指定）
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# スマート引用符を無効化
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# スマートダッシュを無効化
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# スペルチェックを無効化
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# トラックパッドのタップでクリックを有効化
# 注意: 現在は未設定になっていますが、システム設定で既に有効化されている可能性があります
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# ナチュラルスクロール方向を設定（現在は未設定）
# 注意：現在未設定になっていますが、システムの設定によって既に設定されている可能性があります
# true: 自然なスクロール方向（デフォルト）、false: 従来のスクロール方向
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# 入力ソースを切り替えるショートカットを設定
# 注意: 現在は未設定または別の方法で設定されています
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "{enabled = 1; value = {parameters = (32, 49, 1048576); type = standard; }; }"
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "{enabled = 1; value = {parameters = (32, 49, 1572864); type = standard; }; }"

# Finderのサイドバーのデフォルトアイテムを設定
# 注意: この設定は複雑なため、必要な場合のみコメントを解除してください
# defaults write com.apple.sidebarlists favoriteditems -array-add '{ "CustomListItems" = ( { "Alias" = null; "CustomItemProperties" = { "com.apple.LSSharedFileList.TemplateSystemSelector" = 1000; }; "Name" = "アプリケーション"; "URL" = "file:///Applications/"; } ); }'

# すべての拡張子を表示
defaults write -g AppleShowAllExtensions -bool true

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