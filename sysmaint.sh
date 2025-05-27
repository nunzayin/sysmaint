#!/bin/bash

# Main sysmaint.sh file. Execute it to run the whole system maintenance iteration.
# This file provides some helper functions and includes $HOME/.config/sysm_include.sh file.
# Add your preferred scripts (aka modules) to sysm_include.sh so they will run in sysmaint.sh.

function stage() {
# Usage:
#   stage STAGE_NAME
# Just a macros to print a fancy header for the following stage of the script.
    echo -e "\n----------------------------------------------------"
    echo $1
    echo -e "----------------------------------------------------\n"
}

function check_deps() {
# Usage:
#   check_deps
# Env:
#   MODULE - module name (string)
#   DEPS - iterable list of commands used (dependencies)
# Performs dependencies check for current MODULE by looking for commands listed in DEPS.
# Returns exit code 0 if all the dependencies are satisfied
    echo -e "\n----------------------------------------------------"
    echo -e "\nChecking dependencies for module \"$MODULE\"..."
    local MISSING_DEPS=0
    for DEP in $DEPS; do
        if ! [[ -n "$(command -v $DEP)" ]]; then
            MISSING_DEPS=1
            echo "Missing dependency: $DEP"
        fi
    done
    if [[ $MISSING_DEPS -ne 0 ]]; then
        echo "Satisfy the dependencies above to use $MODULE."
    else
        echo "All seems good to go :D"
    fi
    return $MISSING_DEPS
}

# Use $MODULES variable in your sysm_include.sh to include modules provided in repo.
# Example:
#   . $MODULES/example.sh
MODULES=$(dirname "$0")/sysm_modules

SYSM_INCLUDE="$HOME/.config/sysm_include.sh"
if ! [[ -e $SYSM_INCLUDE ]]; then
    echo "echo '$SYSM_INCLUDE is not configured. Consider reading https://github.com/nunzayin/util#configuring'" > $SYSM_INCLUDE
fi
. $SYSM_INCLUDE

stage "SYSTEM MAINTENANCE COMPLETE"
exit 0
