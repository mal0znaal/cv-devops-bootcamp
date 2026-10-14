#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab04/project/data/raw/first.txt" ]] && grep -Fxq found "$HOME/lab04/project/data/raw/first.txt" || { echo "Не найден файл с found"; exit 1; }
echo 'Отлично, результат проверен.'
