# Modules for `sysmaint.sh`

## Introduction

A module is just a shell (bash) script with some specification. Well, you can add
anything you want in the file, but sysmaint provides some helper functions that I
hope are more likely to be used rather than not.\
Each module performs some task related to a certain system maintenance task (e.g.
updating packages, clearing cache etc.). You can add the module to sysmaint iteration
by including it in your `sysm_include.sh` (see the main README).

## Features

### `stage`

```bash
Usage:
    stage STRING
```

The `stage` command provides a simple way to announce some important information.
It prints a given STRING separated from the other output with line breaks and
horizontal rules.

Example: issued command

```bash
stage "A BIG STAGE ANNOUNCEMENT!!!"
```

will print out

```
----------------------------------------------------
A BIG STAGE ANNOUNCEMENT!!!
----------------------------------------------------
```

### Dependency check

The sysmaint provides a helper function `check_deps` which can be used in the `if`
statements to determine whether dependencies are satisfied or not while also
printing all the missing dependencies.

```bash
Usage:
    check_deps
```

This function requires predefined MODULE and DEPS environment variables for each module.
These two vars represent module's header:

```bash
MODULE="module's name" # Traditionally the name is the same as its filename
DEPS=("yay" "fzf" "paccache") # Note that DEPS var should be iterable
```

> [!NOTE]
> Elements of DEPS are not packages, but rather <ins>commands</ins> that are used in your
> module. For example, you have some command like `yay -Qqe | fzf`, so you should add
> `"yay"` and `"fzf"`.

## Creating a module

Create a file where you want. Name it as you want, traditionally since it's a shell script and
will be treated as plain text of bash script source code, it should end with a `.sh` extension.
Implement whatever you want this module to do. You can use helper functions described above.
Also see [`example.sh`](./example.sh) and [`template.sh`](./template.sh).

## Adding a module

Simply add the following line to your `sysm_include.sh`:

```bash
. /path/to/your/module.sh
```

> [!WARNING]
> The dot at the beginning of the line <ins>should</ins> be whitespace separated from the filename.
> See `man 1p dot` for more info.

sysmaint also provides $MODULES variable so you can add modules from this directory:

```bash
. $MODULES/example.sh
```
