#!/usr/bin/env bash
set -euo pipefail

file="$HOME/bootcamp/hello.txt"
if [[ ! -f "$file" ]]; then
  echo "Пока нет файла $file. Создай его через терминал."
  exit 1
fi
if ! grep -Fxq 'linux-ready' "$file"; then
  echo "Файл найден, но ожидается строка linux-ready."
  exit 1
fi
printf 'Отлично! Файл существует и содержит нужную строку.\n'
