# hostctlのプロファイル自動設定スクリプト

このプロジェクトは、各開発者のホスト名設定・管理を簡略化するために、`hostctl`というツールを使用したスクリプトです。

`hostctl`の詳細については、[GitHubリポジトリ](https://github.com/guumaster/hostctl)を参照してください。

## hostctlのインストール

### macOS
Homebrewを使用してインストールできます。
```bash
brew install hostctl
```

### Windows
Scoopを使用してインストールできます。
```powershell
scoop install hostctl
```

### その他の方法
他の方法でインストールしたい場合は、公式ドキュメントを参照してください。
[hostctl公式ドキュメント](https://guumaster.github.io/hostctl/docs/installation/)

## 使い方

コマンドを実行する前に、ホスト名の設定ファイルを用意してください。

`hostctl-profiles/` に設定ファイルを配置します。
ファイルはプロファイルごとに作成し、ファイル名がそのままhostctlのプロファイル名となります。
フォーマットは、hostsファイルに記載しているフォーマットと同じです。

```
# you can access 127.0.0.1 with the host name "my-localhost"
127.0.0.1 my-localhost
127.0.0.2 my-localhost-2
```

### Linux/macOS の場合

1. 任意のシェルを起動して、スクリプトがあるディレクトリに移動する
2. `./setup_hosts.sh` を実行する（sudoを実行しているのでパスワード入力が必要になる可能性あり）

### WindowsユーザーでWSL2上のLinuxを利用している場合

1. 管理者権限でPowerShellを起動して、スクリプトがあるディレクトリに移動する
2. `.\setup_hosts.ps1` を実行する

> [!TIP]
> スクリプトを実行する前に、PowerShellのスクリプト実行ポリシーを変更する必要がある場合があります。
> その場合は、 `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned` を実行します。

