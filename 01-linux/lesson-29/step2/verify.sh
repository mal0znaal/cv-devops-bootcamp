#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab29/pipefail.txt"; [[ -f "$f" ]] && grep -Fxq without=0 "$f" && grep -Fxq with=1 "$f" || exit 1
echo 'Успешно.'
