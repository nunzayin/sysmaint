# This module deletes Arch and AUR orphaned packages using yay.

MODULE="orphans"
DEPS=("yay")

if check_deps; then
    orphaned=$(yay -Qqdt | tr "\n" " " 2>> "$OUT")
    if [ -n "$orphaned" ]; then
        yes "" | yay -Rns $orphaned &>> "$OUT"
    fi
fi
