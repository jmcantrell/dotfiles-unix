#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.local/tmp
chmod 700 ~/.local/tmp

mkdir -p ~/.config/nvim/spell

stow --no-folding -d . -t ~ -R stow
