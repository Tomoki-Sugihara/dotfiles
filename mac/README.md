# Mac 設定スクリプト

このディレクトリには macOS の設定を自動化するための各種スクリプトが含まれています。

## スクリプト一覧

### mac-setup.sh
macOS の初期設定を自動化するスクリプトです。システム環境設定、アプリケーション設定、ユーティリティの設定など、新しい Mac のセットアップに必要な設定を行います。

### read-settings.sh
現在の macOS の設定を読み取り、表示するスクリプトです。システムの設定状態を確認するのに役立ちます。

### export-dock-apps.sh
現在の Dock に固定されているアプリケーションの設定を `dock-apps.plist` ファイルにエクスポートします。新しい Mac に同じ Dock 設定を移行する際に使用します。

### import-dock-apps.sh
`dock-apps.plist` ファイルから Dock の設定をインポートし、現在の Dock に適用します。エクスポートした Dock 設定を復元する際に使用します。実行前に、インポートされるアプリケーションの一覧が表示され、確認後に適用されます。

## ファイル

### dock-apps.plist
Dock に固定されているアプリケーションの設定情報を保存するファイルです。
`export-dock-apps.sh` によって生成され、`import-dock-apps.sh` によって読み込まれます。

## 使用例

新しい Mac をセットアップする場合:
1. `mac-setup.sh` を実行して基本設定を適用
2. `import-dock-apps.sh` を実行して以前の Mac と同じ Dock 設定をインポート

Dock の設定をバックアップする場合:
1. `export-dock-apps.sh` を実行して現在の Dock 設定を保存
