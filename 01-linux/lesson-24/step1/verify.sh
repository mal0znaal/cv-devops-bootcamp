#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab24/fstype.txt" ]] || exit 1; [[ "$(tr -d '\r\n' < "$HOME/lab24/fstype.txt")" == "$(findmnt -n -o FSTYPE / | head -n 1)" ]] || exit 1
echo 'Проверка пройдена.'
