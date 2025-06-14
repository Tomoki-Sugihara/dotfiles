# Homebrew Setup

このディレクトリには、Homebrewのセットアップと管理に関するファイルが含まれています。

## ファイル構成

- `Brewfile` - インストールするパッケージのリスト
- `install.sh` - Homebrewのインストールとパッケージのセットアップを行うスクリプト

## install.sh の使い方

### 基本的な使用方法

```bash
./brew/install.sh
```

このコマンドを実行すると以下の処理が行われます：

1. Homebrewがインストールされていない場合は、自動的にインストール
2. M1 Macの場合は、適切なパスの設定も自動で実行
3. Brewfileに記載されたすべてのパッケージをインストール/アップグレード

### オプション

#### --no-upgrade / -n

既存のパッケージのアップグレードをスキップします。新規パッケージのインストールのみを行いたい場合に使用します。

```bash
./brew/install.sh --no-upgrade
# または
./brew/install.sh -n
```

## Brewfile の管理

現在インストールされているパッケージをBrewfileに出力する場合：

```bash
brew bundle dump --file=./brew/Brewfile --force
```

## 注意事項

- 初回実行時はHomebrewのインストールに時間がかかる場合があります
- M1 Macでは自動的に`/opt/homebrew`にインストールされ、適切なパス設定が行われます
- Intel Macでは従来通り`/usr/local`にインストールされます