# This module updates Arch and AUR packages using yay.

MODULE="update"
DEPS=("yay")

if check_deps; then
    yes "" | yay --answerdiff None --answerclean None --mflags "--noconfirm" -Syu > /dev/null
fi
