#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab11/model-paths.txt"
[[ -f "$f" ]] || exit 1
[[ "$(sort -u "$f" | sed '/^$/d')" == $'models/a.pt\nmodels/b.pt' ]] || { echo "Нужны относительные пути к двум моделям"; exit 1; }
echo 'Проверка пройдена.'
