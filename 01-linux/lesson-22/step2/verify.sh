#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab22/extract.log" ]] && grep -Fq LAB22-HELLO "$HOME/lab22/extract.log" || exit 1
echo 'Проверка пройдена.'
