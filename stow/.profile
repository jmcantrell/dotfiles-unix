#!/usr/bin/env sh

export LANG=en_US.UTF-8

export PATH=$HOME/.local/bin:$PATH
export MANPATH=$HOME/.local/share/man:$MANPATH
export TMPDIR=$HOME/.local/tmp

export EDITOR=vim
export SUDO_EDITOR=$EDITOR
export PAGER=less
export BROWSER=lynx

test -f /etc/profile && . /etc/profile

for profile in ~/.profile.d/*; do
    test -f "$profile" && . "$profile"
done
