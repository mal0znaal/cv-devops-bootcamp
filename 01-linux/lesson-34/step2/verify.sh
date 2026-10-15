#!/usr/bin/env bash
set -euo pipefail

systemctl is-active --quiet cvbootcamp34.service || {
    echo "Сервис не активен"
    exit 1
}

user=$(systemctl show cvbootcamp34.service -p User --value)
[[ "$user" == nobody ]] || {
    echo "Не меняй непривилегированного пользователя службы"
    exit 1
}

app=/opt/cvbootcamp34/app.py
model=/opt/cvbootcamp34/models/model.bin
[[ -f "$app" && -f "$model" ]] || {
    echo "Исходный код и файл модели должны остаться на месте"
    exit 1
}
grep -Fq 'ready = model_path.is_file() and model_path.stat().st_size > 0' "$app" || {
    echo "Не обходи проверку модели изменением приложения"
    exit 1
}
grep -Fxq demo-weights "$model" || {
    echo "Не меняй подготовленный файл модели"
    exit 1
}

result=$(curl --max-time 5 -fsS http://127.0.0.1:8874/health) || {
    echo "HTTP healthcheck ещё не вернул успешный статус"
    exit 1
}
grep -Fq '"status": "ready"' <<< "$result" || {
    echo "Модель ещё недоступна приложению"
    exit 1
}
echo "Сервис восстановлен."
