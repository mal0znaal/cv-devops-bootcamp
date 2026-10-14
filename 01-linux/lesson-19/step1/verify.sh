#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab19/cpu.txt" ]] && [[ "$(tr -d '[:space:]' < "$HOME/lab19/cpu.txt")" == "$(nproc)" ]] || exit 1
echo 'Проверка пройдена.'
