#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab18/pid.txt"
[[ -f "$f" ]] || exit 1
p=$(tr -d '\r\n' < "$f")
[[ "$p" =~ ^[0-9]+$ ]] || exit 1
[[ "$(ps -p "$p" -o comm= | xargs)" = sleep ]] || { echo "Нужно записать PID живого sleep"; exit 1; }
echo 'Задание выполнено.'
