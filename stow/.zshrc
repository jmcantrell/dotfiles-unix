typeset -ga precmd_functions   # before prompt
typeset -ga preexec_functions  # before command is executed
typeset -ga chpwd_functions    # after cd

fpath=(~/.local/share/zsh/functions $fpath)

. ~/.local/share/zsh/scripts/completions/zsh-completions.plugin.zsh
. ~/.local/share/zsh/scripts/syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit && compinit -u

for file in ~/.zshrc.d/*(N) ~/.shrc; do
    . "$file"
done
unset file
