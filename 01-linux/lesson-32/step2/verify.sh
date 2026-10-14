#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab32/runbook.md"; [[ -f "$f" ]] || exit 1
for h in '## Symptoms' '## Evidence' '## Hypothesis'; do grep -Fxq "$h" "$f" || { echo "Нужен заголовок $h"; exit 1; }; done
[[ $(wc -c < "$f") -ge 180 ]] || { echo 'Добавь содержательное объяснение, а не пустые заголовки'; exit 1; }
echo 'Отлично: результат подтверждён.'
