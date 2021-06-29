[[ $- != *i* ]] && return

load_bash() {
    local file
    for file in "$@"; do
        if [[ -f $file ]]; then
            if ! . "$file"; then
                echo "unable to load: $file" >&2
                return 1
            fi
        fi
    done
}

load_bash /etc/bashrc /etc/bash.bashrc
load_bash ~/.bashrc.d/*
load_bash ~/.shrc

unset -f load_bash

# vi:ft=sh
