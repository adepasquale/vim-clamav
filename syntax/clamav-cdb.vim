if exists("b:current_syntax")
    finish
endif

syn case match

syn match SignatureName             /^[^:]*/ nextgroup=ContainerType
syn match ContainerType             /:[^:]*/ nextgroup=ContainerSize
syn match ContainerSize             /:[^:]*/ nextgroup=FileNameRegex
syn match FileNameRegex             /:[^:]*/ nextgroup=FileSizeInContainer
syn match FileSizeInContainer       /:[^:]*/ transparent nextgroup=FileSizeReal
syn match FileSizeReal              /:[^:]*/ nextgroup=IsEncrypted
syn match IsEncrypted               /:[^:]*/ nextgroup=FilePos
syn match FilePos                   /:[^:]*/ nextgroup=Res1
syn match Res1                      /:[^:]*/

syn match LineComment               /^#.*$/

hi link SignatureName           Function
hi link ContainerType           PreProc
hi link ContainerSize           Ignore
hi link FileNameRegex           Type
hi link FileSizeInContainer     Operator
hi link FileSizeReal            Operator
hi link IsEncrypted             String
hi link FilePos                 Special
hi link Res1                    Comment
hi link LineComment             Comment

let b:current_syntax = "clamav-cdb"