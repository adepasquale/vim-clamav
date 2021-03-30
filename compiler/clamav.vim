if exists("current_compiler")
    finish
endif

" scanning a file against itself is the quickest way to check for parsing errors
execute "setlocal makeprg=" . g:clamav_clamscan_cmd . "\\ --quiet\\ --database=%\\ %"
setlocal efm=%ELibClamAV\ Error:\ Problem\ parsing\ database\ at\ line\ %l,%CLibClamAV\ Error:\ Can\'t\ load\ %f:\ %m,%Z,%-GLibClamAV\ Error:\ %m,%-GERROR:\ %m

if g:clamav_compile_onwrite
    augroup python
        au!
        au BufWritePost * call ClamAVCompile(1)
    augroup end
endif

function! ClamAVCompile(writing)
    if !a:writing
        silent make
    else
        silent make!
    endif

    cwindow 2
endfunction

let current_compiler = "clamav"
