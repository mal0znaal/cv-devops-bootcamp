#!/usr/bin/env bash
set -euo pipefail
for f in train.log test.log notes.txt .env.example; do [[ -f "$HOME/lab05/$f" ]] || { echo "Нет файла $f"; exit 1; }; done
echo 'Отлично, результат проверен.'
