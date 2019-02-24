" ctrlp.vim customization

""" Mappings
""""""""""""

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-f>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-y>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-_>', '<c-cr>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<c-w>'],
    \ 'ToggleRegex()':        ['<c-x>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<s-tab>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-tab>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-b>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<c-r>', '<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-a>'],
    \ 'MarkToOpen()':         ['<c-g>'],
    \ 'OpenMulti()':          ['<c-p>'],
    \ 'YankLine()':           [],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-o>'],
    \ }


""" Options
"""""""""""

" mapping to launch ctrlp
let g:ctrlp_map = '<Plug>vem_discard_ctrlp-'

" command to execute when ctrlp is launched
let g:ctrlp_cmd = 'CtrlP'

" search by full path or filename
let g:ctrlp_by_filename = 0

" search using regular expressions or not
let g:ctrlp_regexp = 0

" always open a new instance of a buffer even if it is already being shown
let g:ctrlp_switch_buffer = 0

" open new tabpages at the end
let g:ctrlp_tabpage_position = 'al'

" start at project directory or cmd or current file location (in that order)
let g:ctrlp_working_path_mode = 'ra'

" enable caching
let vem_cachefile_dir = g:vem_cache_dir . 'ctrlp/'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = vem_cachefile_dir

" don't show hidden files
let g:ctrlp_show_hidden = 0

" open new file in current window
let g:ctrlp_open_new_file = 'r'

" open multiple files as hidden buffers
let g:ctrlp_open_multiple_files = 'i'

" don't ask where to open multiple files
let g:ctrlp_arg_map = 0

" include current file in the list of matches
let g:ctrlp_match_current_file = 1

" number of mruf to remember
let g:ctrlp_mruf_max = 20

" save mruf as soon as a file is opened
let g:ctrlp_mruf_save_on_update = 1

" format of filenames
let g:ctrlp_bufname_mod = ':t'

" format of paths
let g:ctrlp_bufpath_mod = ':~:.:h'


""" Statusline
""""""""""""""

let g:ctrlp_status_func = {
    \ 'main': 'VemCtrlpStatusline_main',
    \ 'prog': 'VemCtrlpStatusline_prog',
    \ }

" Arguments: focus, byfname, s:regexp, prv, item, nxt, marked
"            a:1    a:2      a:3       a:4  a:5   a:6  a:7
function! VemCtrlpStatusline_main(...)
    let regex = a:3 ? ' [regex]' : ''
    let byfname = a:2 ==# 'file' ? ' [by filename]' : ''
    let item = ' ' . a:5 . ' '
    let marked = a:7 ==# ' <->' ? '' : a:7 . ' '
    let cwd = ' %=%< ' . getcwd() . ' '
    " Return the full statusline
    return '%#CtrlPStatusline# ' . item . regex . byfname . marked . cwd . '%*'
endf

" Argument: len
"           a:1
function! VemCtrlpStatusline_prog(...)
    let length = ' ' . a:1 . ' '
    let cwd = ' %=%< ' . getcwd() . ' '
    " Return the full statusline
    return '%#CtrlPStatusline# ' . length . cwd . '%*'
endf

