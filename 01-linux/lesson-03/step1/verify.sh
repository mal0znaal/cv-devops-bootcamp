#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab03/parents.txt" ]] || exit 1
[[ "$(tr -d '\r\n' < "$HOME/lab03/parents.txt")" == "-p" ]] || { echo "Опция неверна"; exit 1; }
echo 'Отлично, результат проверен.'
