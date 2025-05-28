# This module refreshes Arch Linux mirrors

MODULE="mirrors.sh"
DEPS=("rate-mirrors" "sudo")

if check_deps; then
    stage "REFRESHING MIRRORS"
    rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist
fi
