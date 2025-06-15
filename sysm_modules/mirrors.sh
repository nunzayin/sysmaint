# This module refreshes Arch Linux mirrors

MODULE="mirrors"
DEPS=("rate-mirrors" "sudo")

if check_deps; then
    stage "REFRESHING MIRRORS"
    rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist.new
    if [[ $(cat /etc/pacman.d/mirrorlist.new | wc -l) -gt 2 ]]; then
        sudo rename mirrorlist.new mirrorlist /etc/pacman.d/mirrorlist.new
        echo "Successfully generated a mirrorlist"
    else
        echo "Errors occurred, mirrorlist hasn't been refreshed"
    fi
fi
