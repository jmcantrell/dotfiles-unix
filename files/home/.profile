for file in ~/.profile.d/*; do
    test -r "$file" || continue
    . "$file" || echo "ERROR: Unable to load: $file" >&2
done
unset file

# vi:ft=sh
