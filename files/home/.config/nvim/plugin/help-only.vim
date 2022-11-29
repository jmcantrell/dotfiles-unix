" Help commands that open in their own window.
command -nargs=1 -complete=help Help help <args> | silent only
command -nargs=1 HelpGrep execute "helpgrep" <q-args> | silent only
