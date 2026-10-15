#!/usr/bin/env bash
set -euo pipefail

health="$HOME/lab34/health.sh"
model=/opt/cvbootcamp34/models/model.bin
backup=/opt/cvbootcamp34/models/model.bin.temporary-test

[[ -f "$health" && -x "$health" ]] || {
    echo "Нужен исполняемый health.sh"
    exit 1
}
grep -Eq 'curl' "$health" || {
    echo "Healthcheck должен выполнять HTTP-запрос"
    exit 1
}
[[ -f "$model" && ! -e "$backup" ]] || {
    echo "Проверь исходный файл модели"
    exit 1
}

timeout 8 "$health" >/dev/null 2>&1 || {
    echo "При работающем сервисе healthcheck должен возвращать 0"
    exit 1
}

# Проверяем, что 503 не маскируется под успех.
mv "$model" "$backup"
trap 'if [[ -e "$backup" ]]; then mv "$backup" "$model"; fi' EXIT
code=$(curl --max-time 5 -s -o /dev/null -w '%{http_code}' http://127.0.0.1:8874/health || true)
[[ "$code" == 503 ]] || { echo "Не удалось смоделировать 503"; exit 1; }

if timeout 8 "$health" >/dev/null 2>&1; then
    echo "Healthcheck возвращает успех при HTTP 503"
    exit 1
fi
mv "$backup" "$model"
trap - EXIT

# Проверяем отказ соединения, затем всегда восстанавливаем службу.
systemctl stop cvbootcamp34.service
trap 'systemctl start cvbootcamp34.service >/dev/null 2>&1 || true' EXIT
if timeout 8 "$health" >/dev/null 2>&1; then
    echo "Healthcheck возвращает успех при выключенном HTTP-сервере"
    exit 1
fi
systemctl start cvbootcamp34.service
trap - EXIT

timeout 8 "$health" >/dev/null 2>&1 || {
    echo "После восстановления службы healthcheck должен снова проходить"
    exit 1
}

notes="$HOME/lab34/runbook.md"
[[ -f "$notes" && $(wc -c < "$notes") -ge 200 ]] || {
    echo "Добавь осмысленный разбор в runbook.md"
    exit 1
}
echo "Healthcheck подтвердил 200, 503 и отказ подключения."
