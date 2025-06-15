# This module clears journalctl logs.
# (systemd is pure evil)

MODULE="syslogs"
DEPS=("journalctl" "sudo")

if check_deps; then
    stage "CLEARING SYSTEM LOGS"
    sudo journalctl --vacuum-time=7d
fi
