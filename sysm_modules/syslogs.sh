# This module clears journalctl logs.
# (systemd is pure evil)

MODULE="syslogs"
DEPS=("journalctl" "sudo")

if check_deps; then
    sudo journalctl -q --vacuum-time=7d
fi
