#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab31/corrected.log"; o="$HOME/lab31/access.log"; [[ -f "$f" && -f "$o" ]] || exit 1; [[ $(grep -Fc 'WRITE 500' "$f") -eq 2 ]] || exit 1; ! grep -Fq POST "$f" || exit 1; [[ $(grep -Fc 'POST 500' "$o") -eq 2 ]] || exit 1
echo 'Успешно.'
