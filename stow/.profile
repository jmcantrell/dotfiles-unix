export LANG=en_US.UTF-8

export PATH=$HOME/.local/bin:$PATH
export TMPDIR=$HOME/.local/tmp

export EDITOR=vim
export SUDO_EDITOR=$EDITOR
export PAGER=less
export BROWSER=lynx

for file in ~/.profile.d/*; do
    test -r "$file" && . "$file"
done
unset file

# vi:ft=sh
