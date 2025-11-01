#!/usr/bin/env sh

updates=$(checkupdates 2>/dev/null)

if [ -z "$updates" ]; then
  num=0
else
  num=$(echo "$updates" | wc -l)
fi

# Bash的参数扩展（如${parameter:-word}）主要进行的是文本替换。
# 当parameter未设置或为空时，它直接将word部分作为字符串整体替换上去，不会主动解析word中的转义序列（如\n、\t等）
# 这些转义序列会保持其字面形式。
jq -c -n \
  --arg text "$num" \
  --arg tooltip "${updates:-系统已是最新状态}" \
  '{
    text: $text,
    tooltip: $tooltip,
    class: (if $text != "0" then "update-available" else "" end)
  }'
