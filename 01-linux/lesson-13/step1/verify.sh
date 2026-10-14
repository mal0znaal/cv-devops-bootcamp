#!/usr/bin/env bash
set -euo pipefail
[[ ! -e "$HOME/lab13/original.txt" && -f "$HOME/lab13/hard.txt" ]] || exit 1
grep -Fxq weights "$HOME/lab13/hard.txt" || exit 1
echo 'Задание выполнено.'
