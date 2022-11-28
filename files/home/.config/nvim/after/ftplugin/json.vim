setlocal shiftwidth=2 softtabstop=2 tabstop=2

let b:ale_linters = ['jq']
let b:ale_fixers = ['prettier', 'jq']
let b:ale_json_jq_options = &expandtab ? '--indent ' . &tabstop : '--use-tabs'
