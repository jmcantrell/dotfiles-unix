[[ $- != *i* ]] && return

for file in ~/.shrc /etc/{bashrc,bash.bashrc} ~/.bashrc.d/*; do
    [[ -r $file ]] || continue
    . "$file" || printf "%s: line %s: unable to load file -- %s\n" "$0" "$LINENO" "$file" >&2
done
unset file

# vi:ft=bash
