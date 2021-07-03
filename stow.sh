#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.config/nvim/spell

stow --no-folding -d . -t ~ -R stow
