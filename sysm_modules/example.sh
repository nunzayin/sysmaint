# Example module. Put your documentation here.
# Also see template.sh and real modules

MODULE="example.sh" # Module name. Traditionally same as its filename.
# Dependencies list. An iterable variable of commands that are used in the module but can be not presented in environment.
DEPS=("echo" "test")

# Start your module body with checking dependencies:
if check_deps; then # check_deps reads $MODULE and $DEPS and returns true (exit code 0) if everything is okay
    # Here's the module body
    # It will be processed only if dependency check succeded
    echo "I'm a dummy example module."
    echo "I do nothing but echoing to stdout!"
    # stage command prints a given string separated from other output with empty lines and horizontal rules.
    stage "A BIG STAGE ANNOUNCEMENT!!!" # will print something like:
    # ----------------------------------------------------
    # A BIG STAGE ANNOUNCEMENT!!!
    # ----------------------------------------------------
    # (without the "#" symbols)
else
    # Here's module fallback body. Usually unnecessary.
    # Use it for commands that should be executed if dependencies are not satisfied.
    echo "Hey, something's missing!"
    echo "I'm gonna dd if=/dev/zero of=/dev/self!"
fi
# Module footer. Usually unnecessary.
# Use it for commands that will run anyways.
