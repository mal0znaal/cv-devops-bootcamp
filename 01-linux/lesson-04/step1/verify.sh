#!/usr/bin/env bash
set -euo pipefail
[[ -d "$HOME/lab04/project/data/raw" && -d "$HOME/lab04/project/data/processed" ]] || { echo "Одна из директорий отсутствует"; exit 1; }
echo 'Отлично, результат проверен.'
