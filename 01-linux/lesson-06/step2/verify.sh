#!/usr/bin/env bash
set -euo pipefail
[[ ! -e "$HOME/lab06/remove.tmp" && -f "$HOME/lab06/safe.txt" ]] || exit 1
grep -Fxq safe "$HOME/lab06/safe.txt" || { echo "Нет safe"; exit 1; }
echo 'Проверка пройдена.'
