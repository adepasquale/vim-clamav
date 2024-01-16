-- Lua
vim.api.nvim_exec([[
  augroup clamav
    autocmd!
    autocmd BufNewFile,BufRead *.hdb set filetype=clamav-hdb
    autocmd BufNewFile,BufRead *.ldb set filetype=clamav-ldb
    autocmd BufNewFile,BufRead *.cdb set filetype=clamav-cdb
  augroup END
]], false)