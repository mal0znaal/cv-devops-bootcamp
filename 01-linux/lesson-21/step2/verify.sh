#!/usr/bin/env bash
set -euo pipefail
systemctl is-active --quiet lab21-web.service || { echo 'Сервис не активен'; exit 1; }; curl --max-time 5 -fsS http://127.0.0.1:8765/ | grep -Fq hello-systemd || { echo 'Неверный HTTP-ответ'; exit 1; }
echo 'Проверка пройдена.'
