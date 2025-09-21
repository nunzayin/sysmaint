# This module refreshes Arch Linux mirrors

MODULE="mirrors"
DEPS=("rankmirrors" "sudo")

if module_prolog; then
    rankmirrors /etc/pacman.d/mirrorlist 2>> "$OUT" | sudo tee /etc/pacman.d/mirrorlist.new &>> "$OUT"
    if [[ -n $(grep '^Server = .*$' /etc/pacman.d/mirrorlist.new 2>> "$OUT") ]]; then
        sudo rename mirrorlist.new mirrorlist /etc/pacman.d/mirrorlist.new 2>> "$OUT"
    else
        sysm_log "Errors were encountered when generating mirrorlist"
    fi
fi
