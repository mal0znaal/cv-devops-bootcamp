# Используй ssh config и режим проверки

Создай файл `~/lab26/config`:

```sshconfig
Host cv-training
    HostName 127.0.0.1
    User student
    Port 2222
    IdentityFile ~/lab26/id_ed25519
```

Выполни `ssh -G -F ~/lab26/config cv-training` и найди результат `hostname`, `user`, `port`. **Подключаться ни к какому серверу не нужно**.

---

Проверка оценивает итоговое состояние учебной машины.
