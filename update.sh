#!/usr/bin/env sh

set -e

export PATH=$PWD/bin:$PATH

git pull origin master
git submodule update --recursive --init

generate-vim-helptags
update-vim-rplugins
