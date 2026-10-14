#!/usr/bin/env bash
set -euo pipefail
source /etc/os-release
[[ -f "$HOME/lab01/distribution.txt" ]] || exit 1
[[ "$(tr -d '\r\n' < "$HOME/lab01/distribution.txt")" == "$NAME" ]] || { echo "Нужно значение NAME из os-release"; exit 1; }
echo 'Отлично, результат проверен.'
