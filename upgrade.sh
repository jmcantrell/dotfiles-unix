#!/usr/bin/env bash

set -euo pipefail

git submodule update --remote

./build.sh
