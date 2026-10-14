#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab28/mkproject.sh"; [[ -f "$f" && -x "$f" ]] || exit 1; target="$HOME/lab28/check space"; "$f" "$target" || exit 1; for d in models logs data; do [[ -d "$target/$d" ]] || { echo "Не создан $d"; exit 1; }; done
echo 'Успешно.'
