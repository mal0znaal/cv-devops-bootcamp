#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab34/health.sh"
[[ -f "$f" && -x "$f" ]] || { echo 'Нет исполняемого health.sh'; exit 1; }
grep -Eq 'curl' "$f" || { echo 'Проверка должна обращаться к HTTP'; exit 1; }
"$f" >/dev/null 2>&1 || { echo 'Healthcheck падает'; exit 1; }
d="$HOME/lab34/runbook.md"; [[ -f "$d" && $(wc -c < "$d") -ge 200 ]] || { echo 'Допиши осмысленный разбор в runbook.md'; exit 1; }
echo 'Отлично: результат подтверждён.'
