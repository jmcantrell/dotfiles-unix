#!/usr/bin/env sh

set -e

git pull origin master
git submodule update --recursive --init
