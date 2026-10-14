#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab20/pid.txt"; [[ -f "$f" ]] || exit 1; p=$(tr -d '\r\n' < "$f"); [[ "$p" =~ ^[0-9]+$ && -f "/proc/$p/status" ]] || exit 1; [[ "$(ps -p "$p" -o comm= | xargs)" == bash ]] || exit 1
echo 'Проверка пройдена.'
