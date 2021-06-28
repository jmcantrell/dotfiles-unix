prepend_path() {
    case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1${PATH:+:$PATH}" ;;
    esac
}

export LANG=en_US.UTF-8

export PATH=$HOME/.local/bin:$PATH
export MANPATH=$HOME/.local/share/man:$MANPATH
export TMPDIR=$HOME/.local/tmp

export EDITOR=vim
export SUDO_EDITOR=$EDITOR
export PAGER=less
export BROWSER=lynx

if test -d ~/.profile.d; then
    for profile in ~/.profile.d/*; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi

unset -f prepend_path

# vi:ft=sh
