typeset -ga precmd_functions   # before prompt
typeset -ga preexec_functions  # before command is executed
typeset -ga chpwd_functions    # after cd

load_zsh() {
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

fpath=($zsh/functions $fpath)

load_zsh $HOME/.local/share/zsh/scripts/completions/zsh-completions.plugin.zsh
load_zsh $HOME/.local/share/zsh/scripts/syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit && compinit -u

load_zsh ~/.zshrc.d/*(N)
load_zsh ~/.shrc

unset -f load_zsh
