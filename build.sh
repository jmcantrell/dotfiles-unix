#!/usr/bin/env bash

set -euo pipefail

export PATH=$PWD/bin:$PATH

generate-nvim-helptags
update-nvim-rplugins
