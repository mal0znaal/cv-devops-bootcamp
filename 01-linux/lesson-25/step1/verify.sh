#!/usr/bin/env bash
set -euo pipefail
curl --max-time 5 -fsS http://127.0.0.1:8765/ | grep -Fq cv-online || { echo 'HTTP сервер не отвечает'; exit 1; }
echo 'Успешно.'
