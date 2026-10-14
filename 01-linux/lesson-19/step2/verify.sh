#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab19/memory.txt" ]] && [[ "$(tr -d '\r\n' < "$HOME/lab19/memory.txt")" == MemAvailable: ]] || exit 1
echo 'Проверка пройдена.'
