# Oh My Zsh update module

MODULE="omz_update.sh"
DEPS=("zsh")
# Additional custom dependency check because checking if OMZ is installed is a bit tricky
function omz_update_deps() {
    if check_deps; then
        echo "Checking Oh My Zsh..."
        if [[ -n $(zsh -ic "command -v omz") ]]; then
            echo "Oh My Zsh found, it's okay :D"
            return 0
        fi
        echo "Oh My Zsh not found"
    fi
    return 127
}

if omz_update_deps; then
    stage "UPDATING OH MY ZSH"
    # Updating it is also... a thing
    zsh -ic "omz update; exit 0"
fi
