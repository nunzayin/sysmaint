# This module clears journalctl logs.
# (systemd is pure evil)

MODULE="syslogs"
DEPS=("journalctl" "sudo")

if module_prolog; then
    sudo journalctl --vacuum-time=7d &>> "$OUT"
fi
