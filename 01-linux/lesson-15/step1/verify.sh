#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab15/uid.txt" && -f "$HOME/lab15/gid.txt" ]] || exit 1
[[ "$(tr -d '\r\n' < "$HOME/lab15/uid.txt")" == "$(id -u)" ]] || exit 1
[[ "$(tr -d '\r\n' < "$HOME/lab15/gid.txt")" == "$(id -g)" ]] || exit 1
echo 'Задание выполнено.'
