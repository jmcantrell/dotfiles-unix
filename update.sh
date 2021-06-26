#!/usr/bin/env bash

set -e

git checkout master
git pull origin master
git submodule update --init --remote
