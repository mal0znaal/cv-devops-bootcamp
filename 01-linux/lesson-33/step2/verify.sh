#!/usr/bin/env bash
set -euo pipefail

systemctl is-active --quiet cvbootcamp33.service || {
    echo "Сервис пока не активен"
    exit 1
}

user=$(systemctl show cvbootcamp33.service -p User --value)
[[ "$user" == nobody ]] || {
    echo "Служба должна работать от пользователя nobody"
    exit 1
}

actual_exec=$(systemctl show cvbootcamp33.service -p ExecStart --value)
[[ "$actual_exec" == *"/opt/cvbootcamp33/site"* ]] || {
    echo "Проверь, откуда HTTP-сервер должен читать подготовленную страницу"
    exit 1
}

result=$(curl --max-time 5 -fsS http://127.0.0.1:8873/) || {
    echo "Проверь HTTP-ответ и логи службы"
    exit 1
}
[[ "$result" == "CV-SERVICE-READY" ]] || {
    echo "Сервис пока не возвращает ожидаемый текст"
    exit 1
}

f="$HOME/lab33/fix.txt"
[[ -f "$f" && $(wc -c < "$f") -ge 70 ]] || {
    echo "Добавь объяснение причины в fix.txt"
    exit 1
}
echo "Служба восстановлена, HTTP-ответ подтверждён."
