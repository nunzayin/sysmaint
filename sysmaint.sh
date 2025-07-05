#!/bin/bash

# Main sysmaint.sh file. Execute it to run the whole system maintenance iteration.
# This file provides some helper functions and includes $HOME/.config/sysm_include.sh file.
# Add your preferred scripts (aka modules) to sysm_include.sh so they will run in sysmaint.sh.

# Usage:
# sysmaint.sh [MODE] [MODULES...]

# Available modes:
# normal (default) - run all the modules in sysm_include
# whitelist (-w, --whitelist) - run only modules in arguments
# blacklist (-b, --blacklist) - run all the modules in sysm_include except arguments
# query (-q, --query) - do not run any modules, just print their names
MODE="normal"
ARGS_MODULES=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        "--whitelist" | "-w")
            MODE="whitelist"
            ;;
        "--blacklist" | "-b")
            MODE="blacklist"
            ;;
        "--query" | "-q")
            MODE="query"
            ;;
        *)
            ARGS_MODULES+=("$1")
    esac
    shift
done

function module_prolog() {
# Usage:
#   module_prolog
# Env:
#   MODULE - module name (string)
#   DEPS - iterable list of commands used (dependencies)
# Performs dependencies check for current MODULE by looking for commands listed in DEPS.
# Returns exit code 0 if all the dependencies are satisfied.
# If in query mode, does nothing, prints module name and returns 1.
    case "$MODE" in
        "normal" | "whitelist" | "blacklist")
            if [[ ( "$MODE" = "whitelist" ) || ( "$MODE" = "blacklist" ) ]]; then
                local IS_MODULE_IN_ARGS=0
                for MOD in "${ARGS_MODULES[@]}"; do
                    if [[ "$MODULE" = "$MOD" ]]; then
                        IS_MODULE_IN_ARGS=1
                        break
                    fi
                done
                if [[ ( ( "$MODE" = "whitelist" ) && ( $IS_MODULE_IN_ARGS -eq 0 ) ) \
                    || ( ( "$MODE" = "blacklist" ) && ( $IS_MODULE_IN_ARGS -eq 1 ) ) ]]
                then
                    return 1
                fi
            fi
            local MISSING_DEPS=0
            for DEP in "${DEPS[@]}"; do
                if ! [[ -n "$(command -v $DEP)" ]]; then
                    MISSING_DEPS=1
                    echo "Missing dependency \"$DEP\" for \"$MODULE\"" &>> "$OUT"
                fi
            done
            return $MISSING_DEPS
            ;;
        "query")
            echo "$MODULE"
            return 1
            ;;
    esac
    # unreachable
    return 1
}

# Use $MODULES variable in your sysm_include.sh to include modules provided in repo.
# Example:
#   . $MODULES/example.sh
MODULES="$(dirname "$(realpath "$0")")"/sysm_modules

# Override output direction with init_out in your sysm_include to redirect logging output
function init_out() {
# Usage:
#   init_out FILENAME
# Redirects the whole stdout and stderr to FILENAME. Clears file initially.
    OUT="$1"
    echo "Sysmaint iteration at $(date)" &> "$OUT"
}
init_out "$HOME/.cache/sysm_log.txt"

SYSM_INCLUDE="$HOME/.config/sysm_include.sh"
if ! [[ -e $SYSM_INCLUDE ]]; then
    echo "echo '$SYSM_INCLUDE is not configured. Consider reading https://github.com/nunzayin/sysmaint#configuring'" > $SYSM_INCLUDE
fi
. $SYSM_INCLUDE

exit 0
