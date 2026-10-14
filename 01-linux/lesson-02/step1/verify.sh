#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab02/ls-path.txt"
[[ -f "$f" ]] || exit 1
v=$(tr -d '\r\n' < "$f")
[[ "$v" = /* && -x "$v" && "$(basename "$v")" = ls ]] || { echo "Найди настоящий бинарник ls"; exit 1; }
echo 'Отлично, результат проверен.'
