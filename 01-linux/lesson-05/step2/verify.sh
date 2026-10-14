#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab05/logs.txt"
[[ -f "$f" ]] || exit 1
[[ "$(sort -u "$f" | sed '/^$/d')" == $'test.log\ntrain.log' ]] || { echo "Нужны ровно test.log и train.log"; exit 1; }
echo 'Отлично, результат проверен.'
