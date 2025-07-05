# Pull git repos by their absolute paths listed in the REPOS variable.
# Set this variable in your sysm_include.

MODULE="git_pull"
DEPS=("git")

if module_prolog; then
    CURRENT_DIR="$(pwd)"
    for REPO in "${REPOS[@]}"; do
        cd $REPO
        git pull &>> "$OUT"
    done
    cd $CURRENT_DIR
fi
