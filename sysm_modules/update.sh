# This module updates Arch and AUR packages using yay.

MODULE="update.sh"
DEPS=("yay")

if check_deps; then
    stage "UPDATING SYSTEM"
    echo "y" | LANG=C yay --answerdiff None --answerclean None --mflags "--noconfirm" -Syu
fi
