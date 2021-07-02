#!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.config/nvim/spell

stow ${VERBOSE:+--verbose} --no-folding -d . -t ~ -R stow
