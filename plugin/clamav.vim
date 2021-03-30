if !exists("g:clamav_sigtool_cmd")
    let g:clamav_sigtool_cmd = "sigtool"
endif

if !exists("g:clamav_clamscan_cmd")
    let g:clamav_clamscan_cmd = "clamscan"
endif

if !exists("g:clamav_compile_onwrite")
    let g:clamav_compile_onwrite = 1
endif

if !exists("g:clamav_max_win_height")
    let g:clamav_max_win_height = 16
endif

function ClamAVEncode() range
    let c = 0
    while c <= (a:lastline - a:firstline)
        let l = a:firstline + 2*c
        call append(l, system(g:clamav_sigtool_cmd . " --hex-dump", getline(l)))
        let c +=1
    endwhile
endfunction

function ClamAVDecode() range
    " decode the ClamAV signature in range
    let clamav_decoded = split(system(g:clamav_sigtool_cmd . " --decode-sigs", join(getline(a:firstline, a:lastline), "\n")), "\n")
    let clamav_win_height = min([g:clamav_max_win_height, len(clamav_decoded)])

    " create a buffer or use the existing one
    let bn = bufnr("__ClamAV__")
    if bn > 0
        let wi = index(tabpagebuflist(tabpagenr()), bn)
        if wi >= 0
            silent execute (wi+1) . "wincmd w"
        else
            silent execute "sbuffer " . bn
        endif
    else
        split __ClamAV__
    endif

    " populate the buffer with the decoded signatures
    setlocal modifiable
    setlocal noswapfile
    setlocal buftype=nofile
    silent normal! ggdG
    call append(0, clamav_decoded)
    silent normal! 1G
    setlocal nomodifiable
    setlocal nomodified
    setlocal filetype=clamav-sigtool
    execute "resize " . clamav_win_height
    nnoremap <buffer> q ZQ
endfunction

com -range -nargs=0 ClamAVEncode :<line1>,<line2>call ClamAVEncode()
com -range -nargs=0 ClamAVDecode :<line1>,<line2>call ClamAVDecode()

autocmd FileType clamav-ldb compiler clamav
