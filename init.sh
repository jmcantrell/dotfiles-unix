#!/usr/bin/env bash

set -eu

git submodule update --init --recursive

./build.sh
