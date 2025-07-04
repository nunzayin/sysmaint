# This module clears pacman cache.
# Note that cache of your AUR helper is not handled.

MODULE="pacman_cache"
DEPS=("paccache")

if check_deps; then
    pacman_cache_space_used="$(du -sh /var/cache/pacman/pkg/)"
    echo -e "Space currently in use: $pacman_cache_space_used\n"
    paccache -vrk2
    paccache -ruk0
fi
