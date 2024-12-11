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

## プロファイルの自動登録

コマンドを実行する前に、ホスト名の設定ファイルを用意してください。

`hostctl-profiles/` に設定ファイルを配置します。
ファイルはプロファイルごとに作成し、ファイル名がそのままhostctlのプロファイル名となります。
フォーマットは、hostsファイルに記載しているフォーマットと同じです。

```
# you can access 127.0.0.1 with the host name "my-localhost"
127.0.0.1 my-localhost
127.0.0.2 my-localhost-2
```

### hostsファイルのバックアップ

`hosts`ファイルを書き換える前に、必ずバックアップを取ってください。例として、以下のコマンドを使用してバックアップを作成できます。

#### Linux/macOS
```bash
cp /etc/hosts /etc/hosts.backup
```

#### Windows
```powershell
Copy-Item -Path "C:\Windows\System32\drivers\etc\hosts" -Destination "C:\Windows\System32\drivers\etc\hosts.backup"
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

## プロファイルの有効化・無効化など基本的なhostctlの操作方法

hostctlの基本的な操作方法は、[公式ドキュメント](https://guumaster.github.io/hostctl/docs/getting-started/)を参照してください。

> [!NOTE]
> hostctlの操作には`sudo`や管理者権限が必要です。

### プロファイルの一覧表示

現在のプロファイルを一覧表示するには、以下のコマンドを使用します。

```bash
hostctl list
```

### プロファイルの無効化

特定のプロファイルを無効化するには、以下のコマンドを使用します。

```bash
hostctl disable <profile_name>
```

### プロファイルの有効化

特定のプロファイルを有効化するには、以下のコマンドを使用します。

```bash
hostctl enable <profile_name>
```
