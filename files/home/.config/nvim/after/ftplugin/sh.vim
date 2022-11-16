let b:ale_fixers = ['shfmt']
let b:ale_sh_shfmt_options = '--indent ' . (&expandtab ? &tabstop : 0)
