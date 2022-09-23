for file in ~/.profile ~/.zprofile.d/*(N); do
    if [[ -f $file ]] && ! . "$file"; then
        printf "Unable to source file: %q\n" "$file" >&2
    fi
done
unset file
