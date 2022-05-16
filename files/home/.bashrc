[[ $- != *i* ]] && return

for file in ~/.shrc /etc/{bashrc,bash.bashrc} ~/.bashrc.d/*; do
    [[ -r $file ]] || continue
    . "$file" || echo "ERROR: Unable to load: $file" >&2
done
unset file

# vi:ft=sh
