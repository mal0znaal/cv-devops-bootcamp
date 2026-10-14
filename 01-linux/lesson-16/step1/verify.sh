#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab16/config.env"
[[ -f "$f" ]] && grep -Fxq TOKEN=dummy-not-secret "$f" || exit 1
[[ "$(stat -c %a "$f")" = 600 ]] || { echo "Нужен режим 600"; exit 1; }
echo 'Задание выполнено.'
