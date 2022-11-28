command! CargoPlay !cargo play %

let b:ale_linters = ['analyzer']
let b:ale_fixers = ['rustfmt']

let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
