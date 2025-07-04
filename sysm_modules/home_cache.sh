# This module clears $HOME/.cache

MODULE="home_cache"
DEPS=("trash")

if module_prolog; then
    trash -v ~/.cache/* &>> "$OUT"
fi
