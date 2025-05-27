# Shows some info about main trash size.
# This is important for me since I fear using rm and almost ALWAYS use trash-cli

MODULE="trash_info.sh"
DEPS=()

if check_deps; then
    stage "TRASH CAN INFO"
    trash_size="$(du -sh .local/share/Trash/)"
    echo "Trash size is $trash_size"
    echo "Run 'trash-empty' if you feel it too large"
fi
