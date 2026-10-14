#!/usr/bin/env bash
set -euo pipefail
for f in "my model.pt" copied.pt; do [[ -f "$HOME/lab09/$f" ]] && grep -Fxq weights "$HOME/lab09/$f" || exit 1; done
echo 'Проверка пройдена.'
