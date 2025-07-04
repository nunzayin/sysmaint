# This module refreshes Arch Linux mirrors

MODULE="mirrors"
DEPS=("rate-mirrors" "sudo")

if module_prolog; then
    rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist.new &>> "$OUT"
    if [[ $(cat /etc/pacman.d/mirrorlist.new | wc -l 2>> "$OUT") -gt 2 ]]; then
        sudo rename mirrorlist.new mirrorlist /etc/pacman.d/mirrorlist.new 2>> "$OUT"
    else
        echo "Errors were encountered when generating mirrorlist" &>> "$OUT"
    fi
fi
