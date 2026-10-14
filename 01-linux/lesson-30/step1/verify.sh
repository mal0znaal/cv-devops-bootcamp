#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab30/crontab.txt"; [[ -f "$f" ]] && grep -Fxq '30 2 * * * /usr/bin/echo bootcamp' "$f" || exit 1
echo 'Успешно.'
