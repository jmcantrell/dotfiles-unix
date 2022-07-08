for file in ~/.{profile,bashrc}; do
    [[ -r $file ]] || continue
    . "$file" || echo "$0: line $LINENO: unable to load file: $file" >&2
done
unset file

# vi:ft=sh
