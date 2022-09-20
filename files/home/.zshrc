for file in ~/.shrc ~/.zshrc.d/*(N); do
    if [[ -f $file ]] && ! . "$file"; then
        printf "Unable to source file: %q\n" "$file" >&2
        return 1
    fi
done
unset file
