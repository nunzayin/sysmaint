# This module deletes Arch and AUR orphaned packages using yay.

MODULE="orphans"
DEPS=("yay")

if module_prolog; then
    orphaned=$(yay -Qqdt | tr "\n" " " 2>> "$OUT")
    if [ -n "$orphaned" ]; then
        yes "" | yay -Rns $orphaned &>> "$OUT"
    else
        sysm_log "No orphaned packages to remove."
    fi
fi
