#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab23/version.txt" ]] || exit 1; v=$(dpkg-query -W coreutils | awk '{print $2}'); [[ "$(tr -d '\r\n' < "$HOME/lab23/version.txt")" == "$v" ]] || exit 1
echo 'Проверка пройдена.'
