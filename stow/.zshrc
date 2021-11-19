for file in ~/.zshrc.d/*(N) ~/.shrc; do
    . "$file"
done
unset file
