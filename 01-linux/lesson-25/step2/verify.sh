#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab25/health.sh"; [[ -f "$f" && -x "$f" ]] || exit 1; grep -Fq curl "$f" || exit 1; "$f" >/dev/null 2>&1 || { echo 'Healthcheck не проходит'; exit 1; }
echo 'Успешно.'
