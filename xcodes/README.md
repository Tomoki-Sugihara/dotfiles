# xcodes コマンドの使い方

`xcodes`は、複数のXcodeバージョンを管理するための最適なコマンドラインツールです。

## 公式ドキュメント

- GitHub リポジトリ: https://github.com/XcodesOrg/xcodes
- Homebrew Formula: https://formulae.brew.sh/formula/xcodes

## インストール

```bash
# Homebrewでインストール（推奨）
brew install xcodesorg/made/xcodes
```

## 基本的な使い方

### 1. 利用可能なXcodeバージョンの確認

```bash
# すべての利用可能なバージョンを表示
xcodes list

# ベータ版も含めて表示
xcodes list --include-betas
```

### 2. Xcodeのインストール

```bash
# 特定のバージョンをインストール
xcodes install 15.0

# 最新版をインストール（安定版）
xcodes install --latest

# 最新のプレリリース版をインストール
xcodes install --latest-prerelease

# カスタムディレクトリにインストール
xcodes install 15.0 --directory "/Applications/Xcode-15.0.app"

# ローカルのXIPファイルからインストール
xcodes install 14.3 --path ~/Downloads/Xcode_14.3.xip
```

### 3. インストール済みXcodeの確認

```bash
# インストールされているXcodeバージョンを表示
xcodes installed
```

### 4. アクティブなXcodeの切り替え

```bash
# 特定のバージョンに切り替え
xcodes select 15.0

# インタラクティブに選択
xcodes select
```

### 5. Xcodeのアンインストール

```bash
# 特定のバージョンをアンインストール
xcodes uninstall 14.0
```

### 6. シミュレータランタイムの管理

```bash
# 利用可能なランタイムを表示
xcodes runtimes

# ベータ版も含めて表示
xcodes runtimes --include-betas

# 特定のランタイムをインストール
xcodes runtimes install "iOS 17.0"
```

### 7. その他のコマンド

```bash
# xcodesのバージョンを表示
xcodes version

# 利用可能なバージョンリストを更新
xcodes update

# 保存されたApple IDをクリア
xcodes signout
```

## 認証について

初回使用時にApple IDの認証が必要です：

```bash
# 環境変数で認証情報を設定
export XCODES_USERNAME="your-apple-id@example.com"
export XCODES_PASSWORD="your-password"
```

認証後、パスワードはキーチェーンに保存され、Apple IDは記憶されます。

## 高速化オプション

### aria2を使用した高速ダウンロード

```bash
# aria2をインストール
brew install aria2

# 環境変数を設定
export XCODES_DOWNLOADER=aria2

# 16並列接続でダウンロード（デフォルト）
xcodes install --latest
```

### 実験的な高速展開

```bash
# 高速な展開方法を使用
xcodes install 15.0 --experimental-unxip
```

## トラブルシューティング

- **Apple IDロック**: 認証に失敗した場合、Apple IDがロックされることがあります。その場合はパスワードをリセットしてください。
- **iOS 18ランタイム**: `xcodes runtimes`コマンドでのダウンロードはサポートされていません。
- **権限エラー**: `/Applications`へのインストールには管理者権限が必要です。

## 関連ツール

- **Xcodes.app**: GUIバージョンが必要な場合は、[Xcodes.app](https://github.com/RobotsAndPencils/XcodesApp)を使用してください。
- **fastlane統合**: fastlaneの`xcodes`アクションとして利用可能です。