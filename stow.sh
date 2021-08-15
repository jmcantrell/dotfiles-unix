#!/usr/bin/env bash

set -eu

mkdir -p ~/.local/tmp
chmod 700 ~/.local/tmp

mkdir -p ~/.gnupg
chmod -R 700 ~/.gnupg

mkdir -p ~/.ssh
chmod -R 700 ~/.ssh
touch ~/.ssh/{known_hosts,authorized_keys}
chmod 600 ~/.ssh/{id_*,known_hosts,authorized_keys}

mkdir -p ~/.local/etc/nvim/spell

ln -sfrT ~/.local/etc ~/.config

stow --no-folding -d . -t ~ -R stow

./build.sh
