# Создай журнал событий

Создай `~/lab10/app.log` со следующими строками:

```text
INFO started
WARN slow request
ERROR model missing
INFO retry
ERROR gpu unavailable
INFO stopped
```

Попробуй `grep -n ERROR`, `grep -i warn`, `grep -v INFO`. Важно увидеть, почему количество выводимых строк меняется.

---

CHECK проверяет результат. При неудаче прочитай ошибку и исследуй причину.
