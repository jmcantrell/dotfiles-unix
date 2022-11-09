for file in ~/.shrc ~/.zshrc.d/*; do
    test -f "$file" && . "$file"
done
unset file
