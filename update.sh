#!/usr/bin/env bash

set -eu

git pull origin main
git submodule update --init --recursive

./build.sh
