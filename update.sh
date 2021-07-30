#!/usr/bin/env bash

set -euo pipefail

git pull origin master
git submodule update --init --recursive

./build.sh
