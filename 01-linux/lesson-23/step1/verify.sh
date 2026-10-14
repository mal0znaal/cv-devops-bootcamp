#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab23/package.txt" ]] && [[ "$(tr -d '\r\n' < "$HOME/lab23/package.txt")" == coreutils ]] || exit 1
echo 'Проверка пройдена.'
