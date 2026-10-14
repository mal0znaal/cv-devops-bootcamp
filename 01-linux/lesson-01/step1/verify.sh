#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab01/kernel.txt" ]] || { echo "Создай kernel.txt"; exit 1; }
[[ "$(tr -d '\r\n' < "$HOME/lab01/kernel.txt")" == "$(uname -r)" ]] || { echo "Версия ядра должна совпасть с uname -r"; exit 1; }
echo 'Отлично, результат проверен.'
