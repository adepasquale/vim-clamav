-- Lua
vim.api.nvim_exec([[
  if exists("b:current_syntax")
      finish
  endif
]], false)

vim.cmd('syntax case match')

vim.cmd('syntax region SignatureName start="^VIRUS NAME: "hs=e end="$" oneline')

vim.cmd('syntax region TargetDescriptionBlock start="^TDB: "hs=e end="$" contains=TDBKey oneline')
vim.cmd('syntax keyword TDBKey contained nextgroup=TDBKeyEnd Target Engine FileSize EntryPoint NumberOfSections Container Intermediates IconGroup1 IconGroup2')

vim.cmd('syntax region LogicalExpression start="^LOGICAL EXPRESSION: "hs=e end="$" contains=SubExpressionIndex,SubExpressionModifier oneline')
vim.cmd('syntax match SubExpressionIndex /[0-9]\\+/ contained nextgroup=SubExpressionModifier')
vim.cmd('syntax match SubExpressionModifier /\\((\\|)\\|&\\||\\|[<=>][0-9]\\+\\(,[0-9]\\+\\)?\\)/ contained nextgroup=SubExpressionIndex')

vim.cmd('syntax region SubSignatureID start="^ \\* SUBSIG ID "hs=e end="$" oneline')
vim.cmd('syntax region SubSignatureOffset start="^ +-> OFFSET: "hs=e end="$" oneline')
vim.cmd('syntax region SubSignatureModifiers start="^ +-> SIGMOD: "hs=e end="$" oneline')
vim.cmd('syntax region SubSignatureDecoded start="^ +-> DECODED SUBSIGNATURE:$"hs=e end="^.*$"')

vim.cmd('hi link SignatureName Function')
vim.cmd('hi link TDBKey PreProc')
vim.cmd('hi link SubExpressionIndex Type')
vim.cmd('hi link SubExpressionModifier Comment')
vim.cmd('hi link SubSignatureID Type')
vim.cmd('hi link SubSignatureOffset Operator')
vim.cmd('hi link SubSignatureModifiers Special')
vim.cmd('hi link SubSignatureDecoded String')

vim.api.nvim_exec([[
  let b:current_syntax = "clamav-sigtool"
]], false)