#!/usr/bin/env bash
echo "Готовим неисправный сервис..."
for i in $(seq 1 30); do [[ -f /tmp/cvbootcamp33-ready ]] && break; sleep 1; done
echo "Окружение подготовлено. Начинай расследование."
