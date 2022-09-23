[[ $- != *i* ]] && return

for file in ~/.shrc /etc/{bashrc,bash.bashrc} ~/.bashrc.d/*; do
    if [[ -f $file ]] && ! . "$file"; then
        printf "Unable to source file: %q\n" "$file" >&2
    fi
done
unset file

# vi:ft=bash
