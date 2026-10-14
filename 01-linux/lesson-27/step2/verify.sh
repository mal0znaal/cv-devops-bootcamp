#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab27/one-shot.txt" ]] && grep -Fxq 'CV_RUN=oneshot' "$HOME/lab27/one-shot.txt" || exit 1
echo 'Успешно.'
