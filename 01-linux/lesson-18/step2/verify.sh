#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab18/pid.txt" && -f "$HOME/lab18/stopped.txt" ]] || exit 1
p=$(tr -d '\r\n' < "$HOME/lab18/pid.txt")
[[ "$p" =~ ^[0-9]+$ ]] || exit 1
if [[ -r "/proc/$p/status" ]]; then
  comm=$(ps -p "$p" -o comm= 2>/dev/null | xargs || true)
  state=$(ps -p "$p" -o stat= 2>/dev/null | xargs || true)
  if [[ "$comm" == sleep && "$state" != Z* && -n "$state" ]]; then
    echo "Процесс sleep ещё выполняется. Посмотри его состояние."
    exit 1
  fi
fi
grep -Fxq stopped "$HOME/lab18/stopped.txt" || exit 1
echo 'Задание выполнено.'
