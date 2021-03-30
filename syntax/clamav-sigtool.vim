if exists("b:current_syntax")
    finish
endif

syn case match

syn region SignatureName            start="^VIRUS NAME: "hs=e end="$" oneline

syn region TargetDescriptionBlock   start="^TDB: "hs=e end="$" contains=TDBKey oneline
syn keyword TDBKey                  contained nextgroup=TDBKeyEnd Target Engine FileSize EntryPoint NumberOfSections Container Intermediates IconGroup1 IconGroup2

syn region LogicalExpression        start="^LOGICAL EXPRESSION: "hs=e end="$" contains=SubExpressionIndex,SubExpressionModifier oneline
syn match SubExpressionIndex        /[0-9]\+/ contained nextgroup=SubExpressionModifier
syn match SubExpressionModifier     /\((\|)\|&\||\|[<=>][0-9]\+\(,[0-9]\+\)\?\)/ contained nextgroup=SubExpressionIndex

syn region SubSignatureID           start="^ \* SUBSIG ID "hs=e end="$" oneline
syn region SubSignatureOffset       start="^ +-> OFFSET: "hs=e end="$" oneline
syn region SubSignatureModifiers    start="^ +-> SIGMOD: "hs=e end="$" oneline
syn region SubSignatureDecoded      start="^ +-> DECODED SUBSIGNATURE:$"hs=e end="^.*$"

" TODO: add support for Macro Subsignatures
" TODO: add support for Byte Compare Subsignatures
" TODO: add support for PCRE Subsignatures

hi link SignatureName           Function
hi link TDBKey                  PreProc
hi link SubExpressionIndex      Type
hi link SubExpressionModifier   Comment
hi link SubSignatureID          Type
hi link SubSignatureOffset      Operator
hi link SubSignatureModifiers   Special
hi link SubSignatureDecoded     String

let b:current_syntax = "clamav-sigtool"
