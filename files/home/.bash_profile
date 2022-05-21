for file in ~/.{profile,bashrc}; do
    [[ -r $file ]] || continue
    . "$file" || echo "ERROR: Unable to load: $file" >&2
done
unset file

# vi:ft=sh
