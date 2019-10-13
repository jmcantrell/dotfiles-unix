#!/usr/bin/env sh

export LANG=en_US.UTF-8

export PREFIX=$HOME/.local
export PATH=$PREFIX/bin:$PATH
export MANPATH=$PREFIX/share/man:$MANPATH
export TMPDIR=$PREFIX/tmp

export EDITOR=vim
export PAGER=less
export BROWSER=lynx

# source extra scripts in ~/.profile.d
for profile in $HOME/.profile.d/*; do
    test -f "$profile" && source "$profile"
done
