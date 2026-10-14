#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab10/app.log"
[[ -f "$f" ]] || exit 1
for text in "INFO started" "WARN slow request" "ERROR model missing" "INFO retry" "ERROR gpu unavailable" "INFO stopped"; do grep -Fxq "$text" "$f" || { echo "Нет строки: $text"; exit 1; }; done
echo 'Проверка пройдена.'
