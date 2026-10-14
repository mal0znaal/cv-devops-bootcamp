#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab20/fds.txt"; [[ -f "$f" ]] || exit 1; for x in stdin=0 stdout=1 stderr=2; do grep -Fxq "$x" "$f" || exit 1; done
echo 'Проверка пройдена.'
