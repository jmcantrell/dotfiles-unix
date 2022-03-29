[[ $- != *i* ]] && return

for file in ~/.shrc /etc/{bashrc,bash.bashrc} ~/.bashrc.d/*; do
    if [[ -r $file ]]; then
        . "$file"
    fi
done
unset file

# vi:ft=sh
