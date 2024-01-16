-- Lua
vim.api.nvim_exec([[
  if exists("b:current_syntax")
      finish
  endif
]], false)

vim.cmd('syntax case match')

vim.cmd('syntax match SignatureName /^[^;]*/ nextgroup=TargetDescriptionBlock')

vim.cmd('syntax match TargetDescriptionBlock /;[^;]*/ transparent contains=TDBKey,TDBKeyEnd,TDBValue,TDBValueEnd nextgroup=LogicalExpression')
vim.cmd('syntax keyword TDBKey contained nextgroup=TDBKeyEnd Target Engine FileSize EntryPoint NumberOfSections Container Intermediates IconGroup1 IconGroup2')
vim.cmd('syntax match TDBKeyEnd \':\' contained nextgroup=TDBValue')
vim.cmd('syntax match TDBValue /[^,;]*/ contained nextgroup=TDBValueEnd')
vim.cmd('syntax match TDBValueEnd /[,;]/ contained')

vim.cmd('syntax match LogicalExpression /;[^;]*/ transparent contains=SubExpressionIndex,SubExpressionModifier nextgroup=SubSignature')
vim.cmd('syntax match SubExpressionIndex /[0-9]\\+/ contained nextgroup=SubExpressionModifier')
vim.cmd('syntax match SubExpressionModifier /\\((\\|)\\|&\\||\\|[<=>][0-9]\\+\\(,[0-9]\\+\\)?\\)/ contained nextgroup=SubExpressionIndex')

vim.cmd('syntax match SubSignature /;[^;]*/ transparent contains=SubSignatureOffset,SubSignatureHexBytes,SubSignatureModifiers nextgroup=SubSignature')
vim.cmd('syntax match SubSignatureOffset /\\(*\\|\\(EOF-\\|EP[+-]\\|S[0-9]\\++\\|SE\\|SL+\\)\\?[0-9]\\+\\(,[0-9]\\+\\)??:\\(:\\)@!\\)?\\?/ contained nextgroup=SubSignatureHexBytes')
vim.cmd('syntax match SubSignatureHexBytes /\\(*\\|[0-9?A-Fa-f]\\{2\\}\\|{\\([0-9]\\+-\\?\\|[0-9]*-[0-9]\\+\\|-\\)}\\|([BLW])\\)/ contained nextgroup=SubSignatureHexBytes')
vim.cmd('syntax match SubSignatureModifiers /\\(::[iwfa]\\+\\)?/ contained nextgroup=SubSignatureOffset')

vim.cmd('syntax match LineComment /^#.*$/')

vim.cmd('hi link SignatureName Function')
vim.cmd('hi link TDBKey PreProc')
vim.cmd('hi link TDBValue Identifier')
vim.cmd('hi link SubExpressionIndex Type')
vim.cmd('hi link SubExpressionModifier Comment')
vim.cmd('hi link SubSignatureOffset Operator')
vim.cmd('hi link SubSignatureHexBytes String')
vim.cmd('hi link SubSignatureModifiers Special')

vim.cmd('hi link LineComment Comment')

vim.api.nvim_exec([[
  let b:current_syntax = "clamav-ldb"
]], false)