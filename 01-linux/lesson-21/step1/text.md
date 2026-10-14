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

## Подготовка перед редактированием unit

Сначала прочти в документации `systemd.exec` значения `User=` и `WorkingDirectory=`. Затем отдельно проверь, что пользователь `nobody` может пройти к `/tmp/lab21-site` и прочитать `index.html`. Unit с правильным синтаксисом не гарантирует, что приложение сможет работать с файлами.

В `ExecStart` используй абсолютный путь к Python. Не помещай туда shell-оператор `&&` или перенаправления; systemd не интерпретирует эту строку как полноценную Bash-команду.

**Где не срезать углы:** не подменяй пользователя на root, если видишь ошибку доступа. Найди отсутствующий бит права.
