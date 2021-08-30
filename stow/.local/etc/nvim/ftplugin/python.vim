let b:ale_linters = ['flake8', 'mypy', 'jedils']
let b:ale_fixers = ['black']
let b:ale_python_black_options = '--line-length=79'

let g:python_highlight_all = 1

setlocal commentstring=#%s
