# This module updates Arch and AUR packages using yay.

MODULE="update"
DEPS=("yay" "informant")

if module_prolog; then
    if informant check &>> "$OUT"; then
        yes "" | yay --answerdiff None --answerclean None --mflags "--noconfirm" -Syu &>> "$OUT"
    else
        sysm_log "Consider reading news to perform manual intervention when necessary"
    fi
fi
