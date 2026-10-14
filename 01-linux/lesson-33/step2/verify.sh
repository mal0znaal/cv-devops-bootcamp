#!/usr/bin/env bash
set -euo pipefail
systemctl is-active --quiet cvbootcamp33.service || { echo 'Unit не активен'; exit 1; }
curl --max-time 5 -fsS http://127.0.0.1:8873/ | grep -Fxq CV-SERVICE-READY || { echo 'HTTP пока не отдаёт готовую страницу'; exit 1; }
grep -Fq 'User=nobody' /etc/systemd/system/cvbootcamp33.service || { echo 'Не убирай запуск под непривилегированным пользователем'; exit 1; }
f="$HOME/lab33/fix.txt"; [[ -f "$f" && $(wc -c < "$f") -ge 70 ]] || { echo 'Добавь разбор причины'; exit 1; }
echo 'Отлично: результат подтверждён.'
