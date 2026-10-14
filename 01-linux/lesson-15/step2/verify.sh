#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab15/root-home.txt"
[[ -f "$f" ]] || exit 1
[[ "$(tr -d '\r\n' < "$f")" == "$(getent passwd root | cut -d: -f6)" ]] || exit 1
echo 'Задание выполнено.'
