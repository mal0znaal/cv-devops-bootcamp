#!/usr/bin/env bash
set -euo pipefail
[[ -L "$HOME/lab13/current.txt" ]] || { echo "Нужна именно символическая ссылка"; exit 1; }
[[ "$(cat "$HOME/lab13/current.txt")" == new-weights ]] || { echo "Ссылка ведёт не туда"; exit 1; }
echo 'Задание выполнено.'
