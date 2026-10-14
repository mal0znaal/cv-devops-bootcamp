#!/usr/bin/env bash
set -euo pipefail
script="$HOME/lab32/report.sh"; output="$HOME/lab32/diagnostics.txt"
[[ -f "$script" && -x "$script" && -f "$output" ]] || exit 1
data=$("$script")
grep -Fxq "kernel=$(uname -r)" <<< "$data" || { echo 'Нет корректного kernel'; exit 1; }
grep -Fxq "cpu=$(nproc)" <<< "$data" || { echo 'Нет корректного cpu'; exit 1; }
grep -q '^memory=' <<< "$data" || exit 1
grep -q '^filesystem=' <<< "$data" || exit 1
echo 'Отлично: результат подтверждён.'
