#!/usr/bin/env sh

weather=$(curl -s "https://wttr.in/武汉?format=3")
cat <<EOF
{"text": "${weather}", "tooltip": "点击显示完整预报"}
EOF
