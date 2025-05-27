# This module updates Arch and AUR packages using yay.

MODULE="update.sh"
DEPS=("yay")

if check_deps; then
    stage "UPDATING SYSTEM"
    yay -Syu
fi
