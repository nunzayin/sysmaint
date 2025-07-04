# This module clears $HOME/.cache

MODULE="home_cache"
DEPS=("trash")

if check_deps; then
    trash ~/.cache/*
fi
