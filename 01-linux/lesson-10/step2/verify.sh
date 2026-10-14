#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab10/errors.txt"
[[ -f "$f" && "$(cat "$f")" == $'ERROR model missing\nERROR gpu unavailable' ]] || { echo "Нужны только две строки ERROR"; exit 1; }
echo 'Проверка пройдена.'
