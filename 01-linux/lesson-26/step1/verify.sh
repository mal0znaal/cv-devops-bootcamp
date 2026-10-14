#!/usr/bin/env bash
set -euo pipefail
[[ -f "$HOME/lab26/id_ed25519" && -f "$HOME/lab26/id_ed25519.pub" ]] || exit 1; ssh-keygen -y -f "$HOME/lab26/id_ed25519" 2>/dev/null | awk '{print $2}' | grep -Fxq "$(awk '{print $2}' "$HOME/lab26/id_ed25519.pub")" || { echo 'Ключи не образуют пару'; exit 1; }
echo 'Успешно.'
