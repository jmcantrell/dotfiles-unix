for file in ~/.profile.d/*; do
    test -f "$file" && . "$file"
done
unset file
