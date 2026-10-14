#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab02/options.txt"
[[ -f "$f" ]] || exit 1
[[ "$(sed -n '1p' "$f")" == "-a" && "$(sed -n '2p' "$f")" == "-l" ]] || { echo "Проверь ls --help"; exit 1; }
echo 'Отлично, результат проверен.'
