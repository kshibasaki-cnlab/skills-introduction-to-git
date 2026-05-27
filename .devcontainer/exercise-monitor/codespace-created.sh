#!/bin/bash

# If not running in a Codespace, exit
if [ -z "${CODESPACE_NAME}" ]; then
  echo "Codespace では実行されていません。終了します。"
  exit 0
fi

echo "演習モニター: イベント: codespace-created" >> /workspaces/exercise-monitor.log

# Get Codespace information
CODESPACE_NAME="${CODESPACE_NAME}"

# Send repository dispatch event
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/dispatches" \
  -d '{
    "event_type": "codespace-created",
    "client_payload": {
      "codespace_name": "'"$CODESPACE_NAME"'",
      "timestamp": "'"$(date -u +"%Y-%m-%dT%H:%M:%SZ")"'"
    }
  }' 2>/dev/null || echo "repository_dispatch イベントの送信に失敗しました"

