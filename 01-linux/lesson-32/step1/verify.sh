#!/usr/bin/env bash
set -euo pipefail

script="$HOME/lab32/report.sh"
output="$HOME/lab32/diagnostics.txt"
[[ -f "$script" && -x "$script" && -s "$output" ]] || {
    echo "Нужен исполняемый report.sh и непустой diagnostics.txt"
    exit 1
}

data=$("$script") || { echo "report.sh завершился с ошибкой"; exit 1; }
grep -Fxq "kernel=$(uname -r)" <<< "$data" || { echo "Неверное значение kernel"; exit 1; }
grep -Fxq "cpu=$(nproc)" <<< "$data" || { echo "Неверное значение cpu"; exit 1; }

fstype=$(findmnt -n -o FSTYPE / | head -n 1)
grep -Fxq "filesystem=$fstype" <<< "$data" || {
    echo "Значение filesystem должно соответствовать findmnt"
    exit 1
}

grep -Eq '^memory=.+[0-9]+' <<< "$data" || {
    echo "memory должно содержать измеренное значение, а не только имя поля"
    exit 1
}

for key in kernel cpu memory filesystem; do
    grep -Fq "$key=" "$output" || { echo "В diagnostics.txt нет $key"; exit 1; }
done
echo "Диагностический отчёт проверен."
