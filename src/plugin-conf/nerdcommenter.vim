" nerdcommenter customization

" Don't create mappings
let NERDCreateDefaultMappings = 0

" Align comment delimiters to the left
let NERDDefaultAlign = 'left'

" Chell all lines to know which action to perform by toggling
let NERDToggleCheckAllLines = 0

" Don't use comment delimiters on empty lines
let NERDCommentEmptyLines = 0

" Comment whole lines independently of where the visual selection is
let NERDCommentWholeLinesInVMode = 1

" don't use menu
let NERDMenuMode = 0

" allow commenting already commented lines (nested comments)
let NERDDefaultNesting = 1

" use placeholders to delimit nested comments
let NERDUsePlaceHolders = 1

" add one space between the comment delimiter and the text
let NERDSpaceDelims = 1

" remove trailing whitespace when uncommenting
let NERDTrimTrailingWhitespace = 1

" this configuration makes nerdcommenter add two spaces after
" delimiters in Python code. This fixes it.
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'leftAlt': '#' },
\ }

