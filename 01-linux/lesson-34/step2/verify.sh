#!/usr/bin/env bash
set -euo pipefail
systemctl is-active --quiet cvbootcamp34.service || { echo 'Сервис не активен'; exit 1; }
grep -Fq 'User=nobody' /etc/systemd/system/cvbootcamp34.service || { echo 'Не меняй непривилегированного пользователя'; exit 1; }
result=$(curl --max-time 5 -fsS http://127.0.0.1:8874/health) || { echo 'HTTP healthcheck ещё не 200'; exit 1; }
grep -Fq '"status": "ready"' <<< "$result" || { echo 'Модель ещё недоступна'; exit 1; }
echo 'Отлично: результат подтверждён.'
