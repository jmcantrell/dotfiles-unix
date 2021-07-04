#!/usr/bin/env bash

set -euo pipefail

export PATH=$PWD/bin:$PATH

git checkout master
git pull origin master
git submodule update --recursive --init

generate-vim-helptags
update-vim-rplugins
