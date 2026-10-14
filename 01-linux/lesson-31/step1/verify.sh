#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab31/summary.txt"; [[ -f "$f" ]] || exit 1; for s in 200=2 404=1 500=2; do grep -Fxq "$s" "$f" || { echo "Нет $s"; exit 1; }; done
echo 'Успешно.'
