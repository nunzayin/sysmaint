# This module updates Arch and AUR packages using yay.

MODULE="update"
DEPS=("yay")

if module_prolog; then
    yes "" | yay --answerdiff None --answerclean None --mflags "--noconfirm" -Syu &>> "$OUT"
fi
