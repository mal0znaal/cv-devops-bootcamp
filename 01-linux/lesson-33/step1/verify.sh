#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab33/initial.txt"; [[ -f "$f" ]] || exit 1
for x in unit=active port=8873 http=404; do grep -Fxq "$x" "$f" || exit 1; done
systemctl is-active --quiet cvbootcamp33.service || exit 1
code=$(curl --max-time 5 -s -o /dev/null -w '%{http_code}' http://127.0.0.1:8873/ || true)
[[ "$code" == 404 ]] || { echo 'Пока нужен исходный HTTP 404: исправление — в следующем шаге'; exit 1; }
echo 'Отлично: результат подтверждён.'
