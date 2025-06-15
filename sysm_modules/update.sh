# This module updates Arch and AUR packages using yay.

MODULE="update"
DEPS=("yay")

if check_deps; then
    stage "UPDATING SYSTEM"
    yes "" | yay --answerdiff None --answerclean None --mflags "--noconfirm" -Syu
fi
