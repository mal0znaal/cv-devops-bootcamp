#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab03/sleep.txt" ]] || exit 1
v=$(tr -d '\r\n' < "$HOME/lab03/sleep.txt")
[[ "$v" =~ ^sleep[[:space:]]+2(s)?$ ]] || { echo "Нужен вызов sleep на две секунды"; exit 1; }
echo 'Отлично, результат проверен.'
