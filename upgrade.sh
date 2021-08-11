#!/usr/bin/env bash

set -eu

git submodule update --remote

./build.sh
