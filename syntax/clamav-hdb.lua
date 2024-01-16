-- Lua
vim.api.nvim_exec([[
  if exists("b:current_syntax")
      finish
  endif
]], false)

vim.cmd('syntax case match')

vim.cmd('syntax match HashSignature /^[^:]+:[^:]+:[^:]+$/ transparent contains=HashString,FileSize,SignatureName')
vim.cmd('syntax match SignatureName /:[^:]+$/lc=1 contained nextgroup=FuncLevel')
vim.cmd('syntax match FileSize /:\\(*\\|[0-9]+\\):/lc=1,me=e-1 contained nextgroup=SignatureName')
vim.cmd('syntax match HashString /^[0-9A-Fa-f]{32}\\([0-9A-Fa-f]{16}\\([0-9A-Fa-f]{16}\\)?\\)?:/me=e-1 contained nextgroup=FileSize')

vim.cmd('syntax match LineComment /^#.*$/')

vim.cmd('hi link HashString String')
vim.cmd('hi link FileSize Operator')
vim.cmd('hi link SignatureName Function')

vim.cmd('hi link LineComment Comment')

vim.api.nvim_exec([[
  let b:current_syntax = "clamav-hdb"
]], false)