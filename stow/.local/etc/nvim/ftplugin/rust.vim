let b:ale_linters = ['rls', 'cargo']
let b:ale_fixers = ['rustfmt']

let b:rust_default_edition = '2018'
let b:rust_edition = trim(system('cargo get --edition 2>/dev/null'))
if v:shell_error > 0 || len(b:rust_edition) == 0
    let b:rust_edition = b:rust_default_edition
endif

let g:ale_rust_rustfmt_options = '--edition ' .. b:rust_edition

let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
