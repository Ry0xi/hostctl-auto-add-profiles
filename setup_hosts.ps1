# 管理者権限を確認中...
Write-Host "Checking for Administrator privileges..."

# 管理者権限があるかを確認
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Error: This script requires running as Administrator." -ForegroundColor Red
    exit 1
} else {
    Write-Host "Administrator privileges confirmed." -ForegroundColor Green
}

# hostsファイルへの書き込み権限を確認中...
Write-Host "Checking write access to the hosts file..."

# hostsファイルへの書き込み権限を確認
$hostsFile = "C:\Windows\System32\drivers\etc\hosts"
try {
    $stream = [System.IO.File]::OpenWrite($hostsFile)
    $stream.Close()
    Write-Host "Write access to the hosts file confirmed." -ForegroundColor Green
} catch {
    Write-Host "Error: No write access to the hosts file." -ForegroundColor Red
    exit 1
}

# hostctlのプロファイル設定ファイルが管理されているディレクトリへの、プロジェクトルートからの相対パス
$EtcHostsDir = ".\hostctl-profiles"
# 設定ファイルディレクトリが存在しない場合、エラーメッセージを表示して終了
if (-Not (Test-Path -Path $EtcHostsDir -PathType Container)) {
    Write-Host "Error: $EtcHostsDir directory does not exist." -ForegroundColor Red
    exit 1
}
# 設定ファイルディレクトリ内の各ファイルに対して処理を行う
Get-ChildItem -Path $EtcHostsDir -File | ForEach-Object {
    $ProfileName = $_.BaseName   # ファイル名から拡張子を除いたプロファイル名を取得
    $FilePath = $_.FullName      # ファイルのフルパス
    # プロファイルの作成コマンドを実行
    Write-Host "Creating profile '$ProfileName' from $FilePath..."
    try {
        & hostctl add $ProfileName --from $FilePath
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Profile '$ProfileName' created successfully." -ForegroundColor Green
        } else {
            Write-Host "Error: Failed to create profile '$ProfileName'." -ForegroundColor Red
            exit 1
        }
    } catch {
        Write-Host "Error: Failed to create profile '$ProfileName'." -ForegroundColor Red
        exit 1
    }
}
Write-Host "All profiles have been successfully created." -ForegroundColor Green
