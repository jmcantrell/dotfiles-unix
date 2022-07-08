[[ $- != *i* ]] && return

for file in ~/.shrc /etc/{bashrc,bash.bashrc} ~/.bashrc.d/*; do
    [[ -r $file ]] || continue
    . "$file" || echo "$0: line $LINENO: unable to load file: $file" >&2
done
unset file

# vi:ft=sh
