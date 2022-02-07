[[ $- != *i* ]] && return

for file in /etc/{bashrc,bash.bashrc} ~/.bashrc.d/* ~/.shrc; do
    if [[ -r $file ]]; then
        . "$file"
    fi
done
unset file

# vi:ft=sh
