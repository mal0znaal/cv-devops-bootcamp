#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab14/kernel-type.txt" ]] || exit 1
[[ "$(tr -d '\r\n' < "$HOME/lab14/kernel-type.txt")" == "$(cat /proc/sys/kernel/ostype)" ]] || exit 1
echo 'Задание выполнено.'
