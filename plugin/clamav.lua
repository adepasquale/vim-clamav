-- Lua
vim.g.clamav_sigtool_cmd = vim.g.clamav_sigtool_cmd or "sigtool"
vim.g.clamav_clamscan_cmd = vim.g.clamav_clamscan_cmd or "clamscan"
vim.g.clamav_compile_onwrite = vim.g.clamav_compile_onwrite or 1
vim.g.clamav_max_win_height = vim.g.clamav_max_win_height or 16

function ClamAVEncode(firstline, lastline)
    local c = 0
    while c <= (lastline - firstline) do
        local l = firstline + 2*c
        vim.api.nvim_buf_set_lines(0, l, l, false, {vim.fn.system(vim.g.clamav_sigtool_cmd .. " --hex-dump", vim.api.nvim_buf_get_lines(0, l, l+1, false))})
        c = c + 1
    end
end

function ClamAVDecode(firstline, lastline)
    local clamav_decoded = vim.split(vim.fn.system(vim.g.clamav_sigtool_cmd .. " --decode-sigs", table.concat(vim.api.nvim_buf_get_lines(0, firstline, lastline, false), "\n")), "\n")
    local clamav_win_height = math.min(vim.g.clamav_max_win_height, #clamav_decoded)

    local bn = vim.fn.bufnr("__ClamAV__")
    if bn > 0 then
        local wi = vim.fn.index(vim.fn.tabpagebuflist(vim.fn.tabpagenr()), bn)
        if wi >= 0 then
            vim.api.nvim_command((wi+1) .. "wincmd w")
        else
            vim.api.nvim_command("sbuffer " .. bn)
        end
    else
        vim.api.nvim_command("split __ClamAV__")
    end

    vim.api.nvim_buf_set_option(0, 'modifiable', true)
    vim.api.nvim_buf_set_option(0, 'swapfile', false)
    vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
end