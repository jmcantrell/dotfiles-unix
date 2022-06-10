for file in ~/.profile ~/.zprofile.d/*(N) ~/.zprofile-"${HOST%.local}".d/*(N); do
    [[ -r $file ]] || continue
    . "$file" || echo "ERROR: Unable to load: $file" >&2
done
unset file
