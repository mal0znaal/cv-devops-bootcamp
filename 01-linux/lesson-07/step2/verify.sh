#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab07/summary.txt"
[[ -f "$f" ]] && grep -Fxq count=5 "$f" && grep -Fxq last=shutdown "$f" || { echo "Нужны count=5 и last=shutdown"; exit 1; }
echo 'Проверка пройдена.'
