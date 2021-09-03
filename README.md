# dotfiles-unix

My configuration files and scripts common to all UNIX-like systems.

## Installation

Clone this repository:

```sh
git clone git@gitlab.com:jmcantrell/dotfiles-unix.git ~/.dotfiles-unix
cd ~/.dotfiles-unix
```

Initialize repository, symlink files, install packages, and configure system:

```sh
./scripts/init
./scripts/stow
./scripts/install
./scripts/config
```

Upgrade submodules to the latest version:

```sh
./scripts/upgrade
```

Update repository with the latest changes:

```sh
./scripts/update
```

Remove files from home directory:

```sh
./scripts/unstow
```
