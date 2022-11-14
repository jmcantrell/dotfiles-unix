let b:ale_fixers = ['shfmt']
let b:ale_sh_shfmt_options = '--indent ' . (&et ? &ts : 0)
