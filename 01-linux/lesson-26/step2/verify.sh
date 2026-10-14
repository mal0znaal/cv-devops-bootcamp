#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab26/config"; [[ -f "$f" ]] || exit 1; out=$(ssh -G -F "$f" cv-training 2>/dev/null); grep -Fxq 'hostname 127.0.0.1' <<< "$out" && grep -Fxq 'user student' <<< "$out" && grep -Fxq 'port 2222' <<< "$out" || exit 1
echo 'Успешно.'
