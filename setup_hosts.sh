#!/bin/bash

# hostctlのプロファイル設定ファイルが管理されているディレクトリへの、プロジェクトルートからの相対パス
ETC_HOSTS_DIR="hostctl-profiles"

# 設定ファイルディレクトリが存在しない場合、エラーメッセージを表示して終了
if [ ! -d "$ETC_HOSTS_DIR" ]; then
  echo "Error: $ETC_HOSTS_DIR directory does not exist."
  exit 1
fi

# 設定ファイルディレクトリ内の各ファイルに対して処理を行う
for file in "$ETC_HOSTS_DIR"/*; do
  # ファイル名（プロファイル名）を取得
  profile_name=$(basename "$file")

  # プロファイルの作成コマンドを実行
  echo "Creating profile '$profile_name' from $file"
  sudo hostctl add "$profile_name" --from "$file"

  # 実行結果の確認
  if [ $? -ne 0 ]; then
    echo "Error: Failed to create profile '$profile_name'."
    exit 1
  fi
done

echo "All profiles have been successfully created."
