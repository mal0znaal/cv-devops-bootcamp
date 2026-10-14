#!/usr/bin/env bash
set -euo pipefail
for name in backup.txt model-v1.txt; do [[ -f "$HOME/lab06/$name" ]] && grep -Fxq yolo "$HOME/lab06/$name" || { echo "Проверь $name"; exit 1; }; done
[[ ! -e "$HOME/lab06/model weights.txt" ]] || { echo "Старое имя ещё существует"; exit 1; }
echo 'Проверка пройдена.'
