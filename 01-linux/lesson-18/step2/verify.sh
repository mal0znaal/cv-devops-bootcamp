#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab18/pid.txt" && -f "$HOME/lab18/stopped.txt" ]] || exit 1
p=$(tr -d '\r\n' < "$HOME/lab18/pid.txt")
if ps -p "$p" -o comm= 2>/dev/null | grep -Fxq sleep; then echo "sleep всё ещё работает"; exit 1; fi
grep -Fxq stopped "$HOME/lab18/stopped.txt" || exit 1
echo 'Задание выполнено.'
