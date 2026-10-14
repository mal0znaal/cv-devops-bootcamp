#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab12/tee.txt"
[[ -f "$f" && "$(cat "$f")" == $'gpu=ready\napi=ready' ]] || { echo "Проверь tee.txt"; exit 1; }
echo 'Задание выполнено.'
