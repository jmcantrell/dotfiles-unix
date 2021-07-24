#!/usr/bin/env bash

set -euo pipefail

export PATH=$PWD/bin:$PATH

git pull origin master
git submodule update --init --recursive

generate-vim-helptags
update-vim-rplugins
