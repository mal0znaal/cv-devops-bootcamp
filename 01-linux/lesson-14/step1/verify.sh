#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab14/map.txt"
[[ -f "$f" ]] || exit 1
for x in config=/etc logs=/var processes=/proc devices=/dev programs=/usr; do grep -Fxq "$x" "$f" || { echo "Нет строки $x"; exit 1; }; done
echo 'Задание выполнено.'
