# Напиши unit и подготовь данные

Создай `/tmp/lab21-site/index.html` со строкой `hello-systemd`, настрой доступ к каталогу для `nobody` (чтение). Создай `/etc/systemd/system/lab21-web.service`:

```ini
[Unit]
Description=Learning web service
After=network.target

[Service]
Type=simple
User=nobody
ExecStart=/usr/bin/python3 -m http.server 8765 --bind 127.0.0.1 --directory /tmp/lab21-site
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Если команды выполняются от root в Killercoda — это учебное окружение, не модель для продакшена.

---

Нажми CHECK, когда перепроверил результат самостоятельно.
