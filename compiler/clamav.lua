-- Lua
vim.api.nvim_exec([[
  augroup python
    autocmd!
  augroup END
]], false)

local makeprg = vim.g.clamav_clamscan_cmd .. " --quiet --database=% %"
local efm = "%ELibClamAV Error: Problem parsing database at line %l,%CLibClamAV Error: Can't load %f: %m,%Z,%-GLibClamAV Error: %m,%-GERROR: %m"

vim.api.nvim_buf_set_option(0, 'makeprg', makeprg)
vim.api.nvim_buf_set_option(0, 'efm', efm)

if vim.g.clamav_compile_onwrite then
  vim.api.nvim_exec([[
    augroup python
      autocmd BufWritePost * lua ClamAVCompile(1)
    augroup END
  ]], false)
end

function ClamAVCompile(writing)
  if not writing then
    vim.api.nvim_command('silent make')
  else
    vim.api.nvim_command('silent make!')
  end

  vim.api.nvim_command('cwindow 2')
end

vim.g.current_compiler = "clamav"