#!/usr/bin/env bash

set -eu

export PATH=$PWD/bin:$PATH

generate-nvim-helptags
update-nvim-rplugins
