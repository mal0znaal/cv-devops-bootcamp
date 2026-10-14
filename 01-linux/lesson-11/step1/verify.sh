#!/usr/bin/env bash
set -euo pipefail
for p in models/a.pt models/b.pt logs/train.log data/train.csv; do [[ -f "$HOME/lab11/project/$p" ]] || { echo "Нет $p"; exit 1; }; done
echo 'Проверка пройдена.'
