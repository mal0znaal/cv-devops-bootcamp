#!/usr/bin/env bash
set -euo pipefail
journalctl -t cvbootcamp --since '15 minutes ago' --no-pager 2>/dev/null | grep -Fq LAB22-HELLO || { echo 'Не обнаружена запись в журнале'; exit 1; }
echo 'Проверка пройдена.'
