#!/usr/bin/env sh

export LANG=en_US.UTF-8

prefix=$HOME/.local

export PATH=$prefix/bin:$PATH
export MANPATH=$prefix/share/man:$MANPATH

export TMPDIR=$prefix/tmp

export EDITOR=vim
export SUDO_EDITOR=$EDITOR

export BROWSER=lynx

export PAGER=less
export LESS="-R --mouse"

for profile in ~/.profile.d/*; do
    test -f "$profile" && . "$profile"
done
