for file in ~/.shrc ~/.zshrc.d/*(N); do
    . "$file"
done
unset file
