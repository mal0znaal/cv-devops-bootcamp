#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab27/exported.txt" ]] && grep -Fxq training "$HOME/lab27/exported.txt" || exit 1
echo 'Успешно.'
