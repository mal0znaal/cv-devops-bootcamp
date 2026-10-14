# Запусти и проверь сервис

Выполни `systemctl daemon-reload`, затем `systemctl start lab21-web.service`. Исследуй `systemctl status`, `journalctl -u lab21-web.service`, затем `curl -fsS http://127.0.0.1:8765/`.

**Не срезай угол:** если запустить не удалось, сначала выясни причину в журнале. Не пытайся «вылечить» сервис запуском от root.

---

Нажми CHECK, когда перепроверил результат самостоятельно.
