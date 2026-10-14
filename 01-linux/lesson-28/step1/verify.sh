#!/usr/bin/env bash
set -euo pipefail
f="$HOME/lab28/greet.sh"; [[ -f "$f" && -x "$f" ]] || exit 1; [[ "$("$f" cv)" == 'hello, cv' && "$("$f" 'CV engineer')" == 'hello, CV engineer' ]] || { echo 'Аргумент должен поддерживать пробелы'; exit 1; }
echo 'Успешно.'
