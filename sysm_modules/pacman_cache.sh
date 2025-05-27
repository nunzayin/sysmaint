# This module clears pacman cache.
# Note that cache of your AUR helper is not handled.

MODULE="pacman_cache.sh"
DEPS=("paccache")

if check_deps; then
    stage "CLEARING PACMAN CACHE"
    pacman_cache_space_used="$(du -sh /var/cache/pacman/pkg/)"
    echo -e "Space currently in use: $pacman_cache_space_used\n"
    echo "Clearing Cache, leaving newest 2 versions:"
    paccache -vrk2
    echo -e "\nClearing all uninstalled packages:"
    paccache -ruk0
fi
