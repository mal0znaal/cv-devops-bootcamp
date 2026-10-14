#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab08/timeline.txt"
[[ -f "$f" && "$(cat "$f")" == $'train\ninference' ]] || { echo "Нужны две строки train и inference"; exit 1; }
echo 'Проверка пройдена.'
