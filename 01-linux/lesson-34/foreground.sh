#!/usr/bin/env bash
echo "Готовим учебный Python API и unit..."
for i in $(seq 1 30); do [[ -f /tmp/cvbootcamp34-ready ]] && break; sleep 1; done
echo "Готово: диагностику можно начинать."
