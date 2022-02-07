for file in ~/.profile ~/.zprofile.d/*(N); do
    [[ -r $file ]] && . "$file"
done
unset file
