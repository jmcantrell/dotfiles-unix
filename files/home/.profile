for file in /etc/profile ~/.profile.d/*; do
    if test -f "$file" && ! . "$file"; then
        printf "Unable to source file: %q\n" "$file" >&2
    fi
done
unset file

# vi:ft=sh
