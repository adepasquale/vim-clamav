# clamav.vim

This Vim plugin aims at making ClamAV rules easier to read and write.

It's still work in progress. For now it has the following features:

- Encoding multiple strings to hex with `:ClamAVEncode`
- Syntax highlighting for ClamAV .ldb and .hdb files
- Decoding .ldb signatures with `:ClamAVDecode`
- Syntax highlighting for `sigtool --decode-sigs` output
- Show quickfix window using `clamscan --database` on save

Suggested configuration options for `.vimrc`:
```
let g:clamav_sigtool_cmd = "sigtool"
let g:clamav_clamscan_cmd = "clamscan"
let g:clamav_compile_onwrite = 1
let g:clamav_max_win_height = 16
map <leader>vd :ClamAVDecode<CR>
map <leader>ve :ClamAVEncode<CR>
```

Check out or request additional features in the issue tracker:
- [ ] Improve PCRE syntax highlighting for .ldb files
- [ ] Add full syntax highlighting for any ClamAV file type

