#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab09/quoted.txt"
[[ -f "$f" ]] || exit 1
[[ "$(sed -n '1p' "$f")" = '$HOME' && "$(sed -n '2p' "$f")" = "$HOME" ]] || { echo "Нужна буквальная переменная и раскрытое значение"; exit 1; }
echo 'Проверка пройдена.'
