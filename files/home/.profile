for file in ~/.profile.d/*; do
    test -r "$file" || continue
    . "$file" || printf "%s: line %s: unable to load file -- %s\n" "$0" "$LINENO" "$file" >&2
done
unset file

# vi:ft=sh
