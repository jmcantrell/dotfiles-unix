#!/usr/bin/env sh

set -e

export PATH=$PWD/bin:$PATH

git submodule update --recursive --remote

generate-vim-helptags
update-vim-rplugins
