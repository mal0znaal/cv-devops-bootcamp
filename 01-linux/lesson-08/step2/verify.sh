#!/usr/bin/env bash
set -euo pipefail
e="$HOME/lab08/errors.txt"; c="$HOME/lab08/count.txt"
[[ -s "$e" ]] || { echo "Файл errors.txt отсутствует или пуст"; exit 1; }
[[ -f "$c" && "$(tr -d '[:space:]' < "$c")" = 2 ]] || { echo "В count.txt должно быть 2"; exit 1; }
echo 'Проверка пройдена.'
