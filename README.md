# `sysmaint.sh`

This is a bash script that provides a simple framework for creating and executing
system maintenance scripts (aka modules) all at once. Execute one file and
~~get a segfault~~ run all the preconfigured modules.

## Modules

`sysmaint.sh` is just a starting point. The only thing it does is providing some
useful functions and including the config file. All the tasks are performed by
the modules added via the config file. See the source of the module you want to add.
The repository provides some modules that inherit sysmaint's pre-modular features.
You can see them at (and add them from) [`sysm_modules`](./sysm_modules) directory.
Also see the [`sysm_modules/README.md`](./sysm_modules/README.md).

## Dependencies

The main script itself requires bash only whereas each module defines its own
dependencies. See the source of the module you want to add. If dependencies are not
satisfied, the module will be skipped.

## Configuring

All the configurations are made in a single file `$HOME/.config/sysm_include.sh`. It
is a bash script which is supposed to be used just to include other scripts (modules)
you want to add. You should provide absolute paths to the files but sysmaint provides
a simple $MODULES variable that leads to the repo modules directory. Here's a legit
(i.e. working) example `sysm_include.sh` file, try copying it and execute sysmaint:

```bash
. $MODULES/mirrors.sh
. $MODULES/update.sh
. $MODULES/syslogs.sh
```

Of course since it's just a shell script you are free to add there whatever you want.

## Usage

```bash
$ /path/to/util/sysmaint.sh [MODE] [MODULES...]
```

`sysmaint` provides 4 execution modes:
- normal mode (no arguments): execute all the modules specified in `sysm_include`
- whitelist mode (invoke with `-w` or `--whitelist`): same as normal, but only the
modules specified in arguments AND `sysm_include` will be executed.
- blacklist mode (`-b` or `--blacklist`): same as normal, but only the
modules specified in `sysm_include` but NOT in arguments will be executed.
- query mode (`-q` or `--query`) - print module names specified in `sysm_include` in
execution order, do not perform any executions.

You should be able to escalate privileges since a lot of modules use sudo. Using sysmaint as root
will lead to undefined behavior.

> [!WARNING]
> You can use `NOPASSWD` in you sudo config to keep sysmaint's output pretty BUT be careful
> on what modules you are using and what do they do. You were warned.

## Credits
Made by **nz** aka **nunzayin** aka **Nick Zaber**

## License
GNU GPL v3 (see the [`LICENSE`](./LICENSE))
