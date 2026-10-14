#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab16/run.sh"
[[ -f "$f" && "$(stat -c %a "$f")" = 700 ]] || { echo "Установи режим 700"; exit 1; }
[[ "$("$f")" == ready ]] || { echo "Скрипт должен печатать ready"; exit 1; }
echo 'Задание выполнено.'
