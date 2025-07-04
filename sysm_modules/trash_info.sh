# Shows some info about main trash size.
# This is important for me since I fear using rm and almost ALWAYS use trash-cli

MODULE="trash_info"
DEPS=()

if check_deps; then
    trash_size="$(du -sh $HOME/.local/share/Trash/)"
    echo "Trash size is $trash_size"
fi
