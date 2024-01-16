-- Lua
vim.api.nvim_exec([[
  if exists("b:current_syntax")
      finish
  endif
]], false)

vim.cmd('syntax case match')

vim.cmd('syntax match SignatureName /^[^:]*/ nextgroup=ContainerType')
vim.cmd('syntax match ContainerType /:[^:]*/ nextgroup=ContainerSize')
vim.cmd('syntax match ContainerSize /:[^:]*/ nextgroup=FileNameRegex')
vim.cmd('syntax match FileNameRegex /:[^:]*/ nextgroup=FileSizeInContainer')
vim.cmd('syntax match FileSizeInContainer /:[^:]*/ transparent nextgroup=FileSizeReal')
vim.cmd('syntax match FileSizeReal /:[^:]*/ nextgroup=IsEncrypted')
vim.cmd('syntax match IsEncrypted /:[^:]*/ nextgroup=FilePos')
vim.cmd('syntax match FilePos /:[^:]*/ nextgroup=Res1')
vim.cmd('syntax match Res1 /:[^:]*/')

vim.cmd('syntax match LineComment /^#.*$/')

vim.cmd('hi link SignatureName Function')
vim.cmd('hi link ContainerType PreProc')
vim.cmd('hi link ContainerSize Ignore')
vim.cmd('hi link FileNameRegex Type')
vim.cmd('hi link FileSizeInContainer Operator')
vim.cmd('hi link FileSizeReal Operator')
vim.cmd('hi link IsEncrypted String')
vim.cmd('hi link FilePos Special')
vim.cmd('hi link Res1 Comment')
vim.cmd('hi link LineComment Comment')

vim.api.nvim_exec([[
  let b:current_syntax = "clamav-cdb"
]], false)