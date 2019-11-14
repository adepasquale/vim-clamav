if exists("b:current_syntax")
    finish
endif

syn case match

syn match HashSignature     /^[^:]\+:[^:]\+:[^:]\+$/ transparent contains=HashString,FileSize,SignatureName

syn match SignatureName     /:[^:]\+$/lc=1 contained nextgroup=FuncLevel
syn match FileSize          /:\(*\|[0-9]\+\):/lc=1,me=e-1 contained nextgroup=SignatureName
syn match HashString        /^[0-9A-Fa-f]\{32\}\([0-9A-Fa-f]\{16\}\([0-9A-Fa-f]\{16\}\)\?\)\?:/me=e-1 contained nextgroup=FileSize

syn match LineComment       /^#.*$/

hi link HashString          String
hi link FileSize            Ignore
hi link SignatureName       Function

hi link LineComment         Comment

let b:current_syntax = "clamav-hdb"
