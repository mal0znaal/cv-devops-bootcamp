#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab17/private.cfg"
[[ -f "$f" && "$(stat -c %a "$f")" = 640 ]] && grep -Fxq mode=private "$f" || exit 1
echo 'Задание выполнено.'
