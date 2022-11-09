[[ $- != *i* ]] && return

for file in ~/.shrc ~/.bashrc.d/*; do
    test -f "$file" && . "$file"
done
unset file
