# hostctlのプロファイル自動設定スクリプト

## 事前準備

- hostctlのインストール

https://guumaster.github.io/hostctl/docs/installation/ を参考にインストールしてください。

macOSにおいてHomebrewでインストールできることは確認済みです。

## 使い方

### Linux/macOS の場合

1. 任意のシェルを起動して、スクリプトがあるディレクトリに移動する
2. `./setup_hosts.sh` を実行する（sudoを実行しているのでパスワード入力が必要になる可能性あり)

### WindowsユーザーでWSL2上のLinuxを利用している場合

1. 管理者権限でPowerShellを起動して、スクリプトがあるディレクトリに移動する
2. `.\setup_hosts.ps1` を実行する

> [!TIP]
> スクリプトを実行する前に、PowerShellのスクリプト実行ポリシーを変更する必要がある場合があります。
> その場合は、 `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned` を実行します。

