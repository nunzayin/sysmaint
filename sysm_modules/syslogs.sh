# This module clears journalctl logs.
# (systemd is pure evil)

MODULE="syslogs.sh"
DEPS=("journalctl")

if check_deps; then
    stage "CLEARING SYSTEM LOGS"
    sudo journalctl --vacuum-time=7d
fi
