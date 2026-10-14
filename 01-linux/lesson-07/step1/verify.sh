#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab07/events.log" ]] || exit 1
[[ "$(cat "$HOME/lab07/events.log")" == $'boot\nload-model\nready\nrequest\nshutdown' ]] || { echo "Проверь строки событий"; exit 1; }
echo 'Проверка пройдена.'
