#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab12/report.txt"
[[ -f "$f" ]] || exit 1
for line in "200=3" "404=1" "500=2"; do grep -Fxq "$line" "$f" || { echo "Нет $line"; exit 1; }; done
[[ $(grep -c '=' "$f") -eq 3 ]] || exit 1
echo 'Задание выполнено.'
