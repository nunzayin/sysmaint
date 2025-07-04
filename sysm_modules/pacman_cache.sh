# This module clears pacman cache.
# Note that cache of your AUR helper is not handled.

MODULE="pacman_cache"
DEPS=("paccache")

if module_prolog; then
    paccache -vrk2 &>> "$OUT"
    paccache -ruk0 &>> "$OUT"
fi
