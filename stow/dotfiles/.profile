#!/usr/bin/env sh

export LANG=en_US.UTF-8

export PATH=$HOME/.local/bin:$PATH
export MANPATH=$HOME/.local/share/man:$MANPATH
export TMPDIR=$HOME/.local/tmp

export EDITOR=vim
export PAGER=less
export BROWSER=lynx

# source extra scripts in ~/.profile.d
for profile in "$HOME/.profile.d/"*; do
    test -f "$profile" && . "$profile"
done
