#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab24/sparse.img" ]] && [[ "$(stat -c %s "$HOME/lab24/sparse.img")" == 8388608 ]] || exit 1
echo 'Проверка пройдена.'
