#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab30/timer.txt" ]] || exit 1; [[ "$(tr -d '\r\n' < "$HOME/lab30/timer.txt")" == 'Mon..Fri 09:00' ]] || exit 1
echo 'Успешно.'
