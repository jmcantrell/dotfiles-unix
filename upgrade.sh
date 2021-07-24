#!/usr/bin/env bash

set -euo pipefail

export PATH=$PWD/bin:$PATH

git submodule update --remote --recursive

generate-vim-helptags
update-vim-rplugins
