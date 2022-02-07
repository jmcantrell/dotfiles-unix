for file in ~/.profile.d/*; do
    test -r "$file" && . "$file"
done
unset file

# vi:ft=sh
