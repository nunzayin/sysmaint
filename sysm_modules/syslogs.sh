# This module clears journalctl logs.
# (systemd is pure evil)

MODULE="syslogs"
DEPS=("journalctl" "sudo")

if check_deps; then
    sudo journalctl --vacuum-time=7d
fi
