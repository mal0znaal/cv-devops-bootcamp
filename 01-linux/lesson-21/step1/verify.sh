#!/usr/bin/env bash
set -euo pipefail
[[ -f /etc/systemd/system/lab21-web.service && -f /tmp/lab21-site/index.html ]] || exit 1; grep -Fq 'User=nobody' /etc/systemd/system/lab21-web.service || exit 1; grep -Fq hello-systemd /tmp/lab21-site/index.html || exit 1
echo 'Проверка пройдена.'
