#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab29/require-file.sh"; [[ -f "$f" && -x "$f" ]] || exit 1; "$f" >/dev/null 2>&1 && { echo 'Без аргумента нужен ненулевой статус'; exit 1; }; "$f" /definitely-no-such-file >/dev/null 2>&1 && exit 1; [[ "$("$f" /etc/os-release)" == ok ]] || { echo 'Существующий файл должен дать ok'; exit 1; }
echo 'Успешно.'
