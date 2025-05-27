# This module deletes Arch and AUR orphaned packages using yay.

MODULE="orphans.sh"
DEPS=("yay")

if check_deps; then
    stage "REMOVING ORPHANED PACKAGES"
    orphaned=$(yay -Qqdt)
    if [ -n "$orphaned" ]; then
        echo "$orphaned" | yay -Rns -
    else
        echo "No orphaned packages to remove."
    fi
fi
