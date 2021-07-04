[[ $- != *i* ]] && return

for file in /etc/{bashrc,bash.bashrc} ~/.bashrc.d/* ~/.shrc; do
    [[ -r $file ]] && . "$file"
done
unset file

# vi:ft=sh
