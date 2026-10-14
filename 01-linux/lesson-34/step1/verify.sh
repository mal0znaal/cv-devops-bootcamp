#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab34/before.txt"; [[ -f "$f" ]] || exit 1
for s in service=active http=503 port=8874; do grep -Fxq "$s" "$f" || exit 1; done
systemctl is-active --quiet cvbootcamp34.service || exit 1
c=$(curl --max-time 5 -s -o /dev/null -w '%{http_code}' http://127.0.0.1:8874/health || true)
[[ "$c" == 503 ]] || { echo 'Ожидался исходный 503 до ремонта'; exit 1; }
echo 'Отлично: результат подтверждён.'
