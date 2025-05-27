# This module clears $HOME/.cache

MODULE="home_cache.sh"
DEPS=("trash")

if check_deps; then
    stage "CLEARING HOME CACHE"
    home_cache_used="$(du -sh ~/.cache)"
    echo "Clearing ~/.cache/..."
    trash ~/.cache/*
    echo "Spaced saved: $home_cache_used"
fi
