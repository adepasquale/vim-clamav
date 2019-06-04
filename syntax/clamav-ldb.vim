if exists("b:current_syntax")
    finish
endif

syn case match

syn match SignatureName             /^[^;]*/ nextgroup=TargetDescriptionBlock

syn match TargetDescriptionBlock    /;[^;]*/ transparent contains=TDBKey,TDBKeyEnd,TDBValue,TDBValueEnd nextgroup=LogicalExpression
syn keyword TDBKey                  contained nextgroup=TDBKeyEnd Target Engine FileSize EntryPoint NumberOfSections Container Intermediates IconGroup1 IconGroup2
syn match TDBKeyEnd                 ':' contained nextgroup=TDBValue
syn match TDBValue                  /[^,;]*/ contained nextgroup=TDBValueEnd
syn match TDBValueEnd               /[,;]/ contained

syn match LogicalExpression         /;[^;]*/ transparent contains=SubExpressionIndex,SubExpressionModifier nextgroup=SubSignature
syn match SubExpressionIndex        /[0-9]\+/ contained nextgroup=SubExpressionModifier
syn match SubExpressionModifier     /\((\|)\|&\||\|[<=>][0-9]\+\(,[0-9]\+\)\?\)/ contained nextgroup=SubExpressionIndex

syn match SubSignature              /;[^;]*/ transparent contains=SubSignatureOffset,SubSignatureHexBytes,SubSignatureModifiers nextgroup=SubSignature
syn match SubSignatureOffset        /\(*\|\(EOF-\|EP[+-]\|S[0-9]\++\|SE\|SL+\)\?[0-9]\+\(,[0-9]\+\)\?:\(:\)\@!\)\?/ contained nextgroup=SubSignatureHexBytes
syn match SubSignatureHexBytes      /\(*\|[0-9?A-Fa-f]\{2\}\|{\([0-9]\+-\?\|[0-9]*-[0-9]\+\)}\|([BLW])\)/ contained nextgroup=SubSignatureHexBytes
syn match SubSignatureModifiers     /\(::[iwfa]\+\)\?/ contained nextgroup=SubSignatureOffset

" TODO: add support for Macro Subsignatures
" TODO: add support for Byte Compare Subsignatures
" TODO: add support for PCRE Subsignatures

hi link SignatureName           Function
hi link TDBKey                  PreProc
hi link TDBValue                Ignore
hi link SubExpressionIndex      Type
hi link SubExpressionModifier   Comment
hi link SubSignatureOffset      Operator
hi link SubSignatureHexBytes    String
hi link SubSignatureModifiers   Comment

let b:current_syntax = "clamav-ldb"
