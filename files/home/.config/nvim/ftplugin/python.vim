let g:python_highlight_all = 1

let b:ale_linters = ['flake8', 'mypy', 'jedils']
let b:ale_fixers = ['black']
let b:ale_python_black_options = '--line-length=79'
let b:ale_python_flake8_options = '--extend-ignore E401'

setlocal commentstring=#%s