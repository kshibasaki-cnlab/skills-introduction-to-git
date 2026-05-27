#!/bin/bash

echo "演習モニター: インストールを開始しました"

# Install exercise monitor
cp -r /workspaces/${RepositoryName}/.devcontainer/exercise-monitor /home/vscode/.vscode-remote/data/Machine/exercise-monitor
echo "演習モニター: モニターファイルを Codespace にコピーしました"

# Enable Git hook events
git config --global core.hooksPath /home/vscode/.vscode-remote/data/Machine/exercise-monitor/.githooks
echo "演習モニター: イベントを有効化しました: post-commit"
echo "演習モニター: イベントを有効化しました: post-checkout"
echo "演習モニター: イベントを有効化しました: post-merge"

# Add support for running monitors in the background using tmux and inotify
sudo apk add tmux
sudo apk add inotify-tools

# Trigger codespace created event
/home/vscode/.vscode-remote/data/Machine/exercise-monitor/codespace-created.sh

echo "演習モニター: インストールが完了しました"
