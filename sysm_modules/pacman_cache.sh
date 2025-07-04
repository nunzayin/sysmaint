# This module clears pacman cache.
# Note that cache of your AUR helper is not handled.

MODULE="pacman_cache"
DEPS=("paccache")

if check_deps; then
    paccache -qvrk2
    paccache -qruk0
fi
