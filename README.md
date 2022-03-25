# `ws` – Interactively Manage Your Development Workspaces

Workspace management: no subshells, no profile setup, **simply extensible**.

![usage animation](img/ws.gif)

(Note: `ws` is not supported natively on Windows.)

- [`ws` – Interactively Manage Your Development Workspaces](#ws-%e2%80%93-interactively-manage-your-development-workspaces)
    - [Installation](#installation)
        - [Third Party Installers](#third-party-installers)
    - [Creating Workspaces](#creating-workspaces)
    - [Removing Workspaces](#removing-workspaces)
    - [Removing Versions](#removing-versions)
    - [Miscellaneous](#miscellaneous)
    - [Optional Environment Variables](#optional-environment-variables)

## Prerequisites

If you are on Mac you MUST have these dependencies installed first:

- homebrew
    - coreutils
    - tree
- git
- golang (optional)
- java (optional)

## Installation

The easiest way to install `ws` is through the web:

    curl -L https://git.io/ws-get | bash -s -- install

Once installed, `ws` creates workspaces in subdirectory `ws/workspaces` of the directory specified in environment variable `WS_PREFIX`, which defaults to `$HOME/ws`.

-----

Alternatively, you can clone this repo and

    make install

to install `ws` to `bin/ws` of the directory specified in the environment variable `$PREFIX`, which defaults to `$HOME/ws`. To install `ws` in a custom location (such as `$CUSTOM_LOCATION/bin/ws`), run `PREFIX=$CUSTOM_LOCATION make install`.

### Third Party Installers

On Linux and macOS, [ws-get](https://github.com/continuul/ws-get) allows installation directly from GitHub; for instance:

    curl -L https://raw.githubusercontent.com/continuul/ws-get/master/bin/ws-get | bash

ws-get sets `WS_PREFIX` to `$HOME/ws`, installs `ws` to `$HOME/ws/bin`, modifies the initialization files of supported shells to export `WS_PREFIX` and add `$HOME/ws/bin` to the `PATH`.

## Creating Workspaces

Simply execute `ws <workspace>` to create a workspace of the specified name. If `<workspace>` has already been created, `ws` will set it as the active workspace.

    ws buffalo
    ws cheetah
    ws dolphin

Execute `ws` on its own to view your workspaces, and select the desired workspace.

    $ ws

      buffalo
    ο cheetah
      dolphin

    Use up/down arrow keys to select a workspace, return key to install, d to delete, q to quit

(You can also use `j` and `k` to navigate up or down without using arrows.)

If the active workspace does not change after install, try opening a new shell in case seeing a stale workspace.

## Renaming Workspaces

It is occasionally useful to rename a workspace. There are two straight-forward
methods to accomplish this; the less easy, and very easy.

The hard way is the following. Knowing that `WS_HOME` (`WS_PREFIX`) is the home
directory for all your workspaces, simply run a shell `mv` command to move the
workspace directory:

    mv $WS_HOME/workspaces/source $WS_HOME/workspaces/target

The easy (and equivalent) way is the following. If a `<source>` workspace
already exists and you want to rename it to `<target>`:

    ws mv <source> <target>

## Removing Workspaces

Remove some cached versions:

    ws rm buffalo

Removing all local workspaces except the current workspace:

    ws prune

Remove the installed node and npm (does not affect the cached version). This can be useful
to revert to the system version of node (if in a different location), or if you no longer
wish to use node and npm, or are switching to a different way of managing them.

    ws uninstall

## Miscellaneous

Command line help can be obtained from `ws --help`.

List local workspaces:

    ws ls

Display diagnostics to help resolve problems:

    ws doctor

## Optional Environment Variables

The `ws` command creates workspaces in `$HOME/ws` by default, but you may override this location by defining `WS_PREFIX`.
To change the location to say `$HOME/.ws`, add lines like the following to your shell initialization file:

    export WS_PREFIX=$HOME/.ws
    export PATH=$WS_PREFIX/bin:$PATH
