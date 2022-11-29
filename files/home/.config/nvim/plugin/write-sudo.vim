" Write file with sudo.
command! -bar W :w !sudo tee % >/dev/null<cr>
