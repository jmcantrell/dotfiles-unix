for file in ~/.shrc ~/.zshrc.d/*(N) ~/.zshrc-"${HOST%.local}".d/*(N); do
    [[ -r $file ]] || continue
    . "$file" || echo "ERROR: Unable to load: $file" >&2
done
unset file
