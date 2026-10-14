#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab17/data.txt" && -f "$HOME/lab17/owner-uid.txt" ]] || exit 1
[[ "$(tr -d '\r\n' < "$HOME/lab17/owner-uid.txt")" == "$(stat -c %u "$HOME/lab17/data.txt")" ]] || exit 1
echo 'Задание выполнено.'
