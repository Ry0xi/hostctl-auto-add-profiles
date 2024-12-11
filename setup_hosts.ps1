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
        Write-Host "Profile '$ProfileName' created successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error: Failed to create profile '$ProfileName'." -ForegroundColor Red
        exit 1
    }
}
Write-Host "All profiles have been successfully created." -ForegroundColor Green
