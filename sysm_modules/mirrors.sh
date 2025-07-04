# This module refreshes Arch Linux mirrors

MODULE="mirrors"
DEPS=("rate-mirrors" "sudo")

if check_deps; then
    rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist.new > /dev/null
    if [[ $(cat /etc/pacman.d/mirrorlist.new | wc -l) -gt 2 ]]; then
        sudo rename mirrorlist.new mirrorlist /etc/pacman.d/mirrorlist.new
    else
        echo "Errors were encountered when generating mirrorlist"
    fi
fi
