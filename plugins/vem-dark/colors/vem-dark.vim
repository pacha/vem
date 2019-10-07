"Name: vem-dark
"Description: Default dark theme of Vem, based on the Wombat Vim theme
"Original: https://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/
"Original Author: Lars H. Nielsen
"Vem Adaptation: Andrés Sopeña Pérez

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'vem-dark'

set background=dark

" set different values for terminals with 16 and 256 colors
if &t_Co == 256
    let s:black = '0'
    let s:red = '167'
    let s:white = '255'
    let s:green = '113'
    let s:grey = '246'
    let s:blue = '117'
    let s:yellow = '192'
    let s:intense_red = '160'
    let s:fg = '255'
    let s:bg = '235'
    let s:line_fg = 'none'
    let s:linenr_bg = '233'
    let s:linenr_fg = '246'
    let s:visual_bg = '238'
    let s:visual_fg = '231'
    let s:borders = '237'
    let s:statusline_nc_fg = '243'
    let s:statusline_nc_bg = '238'
    let s:tabline_fg = '0'
    let s:tabline_bg = '251'
    let s:tabline_location = '239'
    let s:terminal_bg = '236'
    let s:special = '252'
    let s:non_text_fg = '244'
    let s:non_text_bg = '236'
    let s:comment = '246'
    let s:fold_fg = '23'
    let s:fold_bg = '7'
    let s:hi_fg = '234'
    let s:hi_green = '114'
    let s:hi_yellow = '186'
    let s:hi_blue = '116'
    let s:hi_orange = '179'
    let s:diffdelete_fg = '236'
    let s:diffdelete_bg = '236'
elseif &t_Co == 16
    let s:black = '0'
    let s:red = '1'
    let s:white = '15'
    let s:green = '10'
    let s:grey = '7'
    let s:blue = '6'
    let s:yellow = '3'
    let s:intense_red = '9'
    let s:fg = '15'
    let s:bg = '0'
    let s:line_fg = '15'
    let s:linenr_bg = '0'
    let s:linenr_fg = '3'
    let s:visual_bg = '8'
    let s:visual_fg = '15'
    let s:borders = '8'
    let s:statusline_nc_fg = '7'
    let s:statusline_nc_bg = '8'
    let s:tabline_fg = '15'
    let s:tabline_bg = '8'
    let s:tabline_location = '15'
    let s:terminal_bg = '0'
    let s:special = '7'
    let s:non_text_fg = '8'
    let s:non_text_bg = '0'
    let s:comment = '8'
    let s:fold_fg = '7'
    let s:fold_bg = '8'
    let s:hi_fg = '15'
    let s:hi_green = '2'
    let s:hi_yellow = '11'
    let s:hi_blue = '6'
    let s:hi_orange = '3'
    let s:diffdelete_fg = '8'
    let s:diffdelete_bg = '0'
else
    let s:black = '0'
    let s:red = '1'
    let s:white = '7'
    let s:green = '2'
    let s:grey = '7'
    let s:blue = '6'
    let s:yellow = '3'
    let s:intense_red = '1'
    let s:fg = '7'
    let s:bg = '0'
    let s:line_fg = '0'
    let s:linenr_bg = '0'
    let s:linenr_fg = '3'
    let s:visual_bg = '3'
    let s:visual_fg = '0'
    let s:borders = '0'
    let s:statusline_nc_fg = '8'
    let s:statusline_nc_bg = '0'
    let s:tabline_fg = '7'
    let s:tabline_bg = '0'
    let s:tabline_location = '0'
    let s:terminal_bg = '0'
    let s:special = '3'
    let s:non_text_fg = '4'
    let s:non_text_bg = '0'
    let s:comment = '2'
    let s:fold_fg = '7'
    let s:fold_bg = '4'
    let s:hi_fg = '7'
    let s:hi_green = '2'
    let s:hi_yellow = '3'
    let s:hi_blue = '6'
    let s:hi_orange = '3'
    let s:diffdelete_fg = '4'
    let s:diffdelete_bg = '0'
endif

" Enable/Disable italic
" If not specified by the user, use italic in GUI and disable it in terminal
" (some terminals don't play along with it too well: iTerm.app, Apple_Terminal)
let s:italic = get(g:, 'vem_colors_italic', has('gui_running')) ? 'italic' : 'none'

""" Set colors

" Normal text
exec "highlight Normal         term=none cterm=none ctermfg=". s:fg ." ctermbg=". s:bg ." guifg=#f6f3e8 guibg=#242424 gui=none"

" Cursor
exec "highlight Cursor         term=none cterm=none ctermfg=". s:white ." ctermbg=". s:intense_red ." guifg=#ffffff guibg=#c00000 gui=none"
exec "highlight CursorIM       term=none cterm=none ctermfg=". s:white ." ctermbg=". s:yellow ." guifg=#555555 guibg=#cae682 gui=none"

" Line numbers
exec "highlight LineNr         term=bold cterm=none ctermfg=". s:linenr_fg ." ctermbg=". s:linenr_bg ." guifg=#857b6f guibg=#111111 gui=none"
exec "highlight CursorLineNr   term=bold cterm=bold ctermfg=". s:white ." ctermbg=". s:linenr_bg ." guifg=#d6d3c8 guibg=#303030 gui=none"

" Visual
exec "highlight Visual         term=reverse cterm=none ctermfg=". s:visual_fg ." ctermbg=". s:visual_bg ." guifg=#ffffff guibg=#444444 gui=none"
exec "highlight VisualNOS      term=reverse cterm=none ctermfg=". s:visual_fg ." ctermbg=". s:visual_bg ." guifg=#ffffff guibg=#444444 gui=none"

" Search
exec "highlight Search         term=bold cterm=none ctermfg=". s:black ." ctermbg=". s:yellow ." guifg=#101010 guibg=#d7ff87 gui=none"
exec "highlight IncSearch      term=bold cterm=none ctermfg=". s:black ." ctermbg=". s:yellow ." guifg=#101010 guibg=#d7ff87 gui=none"
exec "highlight WildMenu       term=bold cterm=none ctermfg=". s:black ." ctermbg=". s:yellow ." guifg=#101010 guibg=#d7ff87 gui=bold"
exec "highlight MatchParen     term=reverse cterm=bold ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=bold"

" Current line & column
exec "highlight CursorLine     term=reverse cterm=none ctermfg=" . s:line_fg . " ctermbg=". s:visual_bg ." guifg=NONE guibg=#404040 gui=none"
exec "highlight ColorColumn    term=reverse cterm=none ctermfg=" . s:line_fg . " ctermbg=". s:visual_bg ." guifg=NONE guibg=#404040 gui=none"
exec "highlight CursorColumn   term=underline cterm=none ctermfg=NONE ctermbg=". s:visual_bg ." guifg=NONE guibg=#404040 gui=none"
exec "highlight QuickFixLine   term=underline cterm=none ctermfg=". s:white ." ctermbg=". s:visual_bg ." guifg=#ffffff guibg=#444444 gui=none"

" Windows, Tabline, Statusline
exec "highlight VertSplit      term=none cterm=none ctermfg=". s:borders ." ctermbg=". s:borders ." guifg=#373737 guibg=#373737 gui=none"
exec "highlight StatusLine     term=reverse cterm=none ctermfg=". s:white ." ctermbg=". s:borders ." guifg=#e6e3d8 guibg=#373737 gui=none"
exec "highlight StatusLineNC   term=none cterm=". s:italic ." ctermfg=". s:statusline_nc_fg ." ctermbg=". s:statusline_nc_bg ." guifg=#857b6f guibg=#404040 gui=" . s:italic
exec "highlight TabLine        term=reverse cterm=none ctermfg=". s:tabline_fg ." ctermbg=". s:tabline_bg ." guifg=#242424 guibg=#cdcdcd gui=none"
exec "highlight TabLineSel     term=none cterm=bold ctermfg=". s:tabline_fg ." ctermbg=". s:white ." guifg=#242424 guibg=#ffffff gui=bold"
exec "highlight TabLineFill    term=reverse cterm=none ctermfg=". s:white ." ctermbg=". s:tabline_bg ." guifg=#e6e3d8 guibg=#404040 gui=" . s:italic

" Terminal
exec "highlight StatusLineTerm   term=reverse cterm=none ctermfg=". s:white ." ctermbg=". s:borders ." guifg=#e6e3d8 guibg=#373737 gui=none"
exec "highlight StatusLineTermNC term=reverse cterm=". s:italic ." ctermfg=". s:statusline_nc_fg ." ctermbg=". s:statusline_nc_bg ." guifg=#857b6f guibg=#444444 gui=" . s:italic
exec "highlight Terminal         term=none cterm=none ctermfg=". s:white ." ctermbg=". s:terminal_bg ." guifg=#f6f3e8 guibg=#303030 gui=none"

" Pmenu
exec "highlight Pmenu          term=none cterm=none ctermfg=". s:white ." ctermbg=". s:borders ." guifg=#f6f3e8 guibg=#404040 gui=none"
exec "highlight PmenuSel       term=none cterm=none ctermfg=". s:black ." ctermbg=". s:yellow ." guifg=#000000 guibg=#cae682 gui=none"
exec "highlight PmenuSbar      term=none cterm=none ctermfg=NONE ctermbg=". s:black ." guifg=NONE guibg=#242424 gui=none"
exec "highlight PmenuThumb     term=none cterm=none ctermfg=NONE ctermbg=". s:grey ." guifg=NONE guibg=#555555 gui=none"

" Folds, Conceal
exec "highlight FoldColumn     term=none cterm=none ctermfg=". s:fold_fg ." ctermbg=". s:fold_bg ." guifg=#a0a8b0 guibg=#384048 gui=none"
exec "highlight Folded         term=none cterm=none ctermfg=". s:fold_fg ." ctermbg=". s:fold_bg ." guifg=#a0a8b0 guibg=#384048 gui=none"
exec "highlight Conceal        guifg=#a0a8b0 guibg=#384048 gui=none"

" Signs
exec "highlight SignColumn     term=none cterm=none ctermfg=". s:grey ." ctermbg=". s:linenr_bg ." guifg=#8ac6f2 guibg=#111111 gui=none"

" Diffs
exec "highlight DiffAdd        term=bold cterm=none ctermfg=". s:hi_fg ." ctermbg=". s:hi_green ." guifg=#f6f3e8 guibg=#0f6346 gui=none"
exec "highlight DiffChange     term=bold cterm=none ctermfg=". s:hi_fg ." ctermbg=". s:hi_blue ." guifg=#f6f3e8 guibg=#2f628e gui=none"
exec "highlight DiffText       term=reverse cterm=none ctermfg=". s:black ." ctermbg=". s:hi_yellow ." guifg=#ffffff guibg=#5f92be gui=bold"
exec "highlight DiffDelete     term=bold cterm=none ctermfg=". s:diffdelete_fg ." ctermbg=". s:diffdelete_bg ." guifg=#404040 guibg=#303030 gui=none"

" Spelling
exec "highlight SpellBad       term=underline cterm=none ctermfg=". s:black . " ctermbg=". s:red ." guisp=#e91929 gui=undercurl"
exec "highlight SpellCap       term=underline cterm=none ctermfg=". s:hi_fg . " ctermbg=". s:hi_blue ." guisp=#cae682 gui=undercurl"
exec "highlight SpellRare      term=underline cterm=none ctermfg=". s:hi_fg . " ctermbg=". s:hi_orange ." guisp=#cae682 gui=undercurl"
exec "highlight SpellLocal     term=underline cterm=none ctermfg=". s:hi_fg . " ctermbg=". s:hi_green ." guisp=#8ac6f2 gui=undercurl"

" Messages
exec "highlight Title          term=bold cterm=bold ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=bold"
exec "highlight Question       term=none cterm=none ctermfg=". s:white ." ctermbg=NONE guifg=#f6f3e8 guibg=NONE gui=none"
exec "highlight MoreMsg        term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"
exec "highlight ModeMsg        term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"
exec "highlight ErrorMsg       term=none cterm=none ctermfg=". s:intense_red ." ctermbg=NONE guifg=#ee0000 guibg=NONE gui=none"
exec "highlight WarningMsg     term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"

" NonText: eol, extends, precedes
exec "highlight NonText        term=none cterm=none ctermfg=". s:non_text_fg ." ctermbg=". s:non_text_bg ." guifg=#808080 guibg=#303030 gui=none"
exec "highlight EndOfBuffer    term=none cterm=none ctermfg=". s:non_text_fg ." ctermbg=". s:non_text_bg ." guifg=#808080 guibg=#303030 gui=none"

" SpecialKey: nbsp, tab, trail
exec "highlight SpecialKey     term=none cterm=none ctermfg=". s:grey ." ctermbg=NONE guifg=#666666 guibg=NONE gui=none"

" Text
exec "highlight Directory      term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"

exec "highlight Comment        term=" . s:italic . " cterm=" . s:italic . " ctermfg=". s:comment ." ctermbg=NONE guifg=#99968b guibg=NONE gui=" . s:italic

exec "highlight Constant       term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Character      term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Number         term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Boolean        term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Float          term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight String         term=" . s:italic . " cterm=" . s:italic . " ctermfg=" . s:green . " ctermbg=NONE guifg=#95e454 guibg=NONE gui=" . s:italic

exec "highlight Identifier     term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"
exec "highlight Function       term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"

exec "highlight Statement      term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight Conditional    term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight Repeat         term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight Label          term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight Operator       term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight Keyword        term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight Exception      term=none cterm=none ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=none"

exec "highlight PreProc        term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Include        term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Define         term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight Macro          term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"
exec "highlight PreCondit      term=none cterm=none ctermfg=". s:red ." ctermbg=NONE guifg=#e5786d guibg=NONE gui=none"

exec "highlight Type           term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"
exec "highlight StorageClass   term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"
exec "highlight Structure      term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"
exec "highlight Typedef        term=none cterm=none ctermfg=". s:yellow ." ctermbg=NONE guifg=#cae682 guibg=NONE gui=none"

exec "highlight Special        term=none cterm=none ctermfg=". s:special ." ctermbg=NONE guifg=#d2d2d2 guibg=NONE gui=bold"
exec "highlight SpecialChar    term=none cterm=none ctermfg=". s:special ." ctermbg=NONE guifg=#d2d2d2 guibg=NONE gui=bold"
exec "highlight Tag            term=none cterm=none ctermfg=". s:special ." ctermbg=NONE guifg=#d2d2d2 guibg=NONE gui=bold"
exec "highlight Delimiter      term=none cterm=none ctermfg=". s:special ." ctermbg=NONE guifg=#d2d2d2 guibg=NONE gui=bold"
exec "highlight Debug          term=none cterm=none ctermfg=". s:special ." ctermbg=NONE guifg=#d2d2d2 guibg=NONE gui=bold"
exec "highlight SpecialComment term=none cterm=none ctermfg=". s:special ." ctermbg=NONE guifg=#d2d2d2 guibg=NONE gui=bold"

exec "highlight Underlined     term=underline cterm=underline ctermfg=". s:blue ." ctermbg=NONE guifg=#8ac6f2 guibg=NONE gui=underline"

exec "highlight Ignore         term=none cterm=none ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE gui=none"

exec "highlight Error          term=reverse cterm=none ctermfg=". s:white ." ctermbg=". s:intense_red ." guifg=#FFFFFF guibg=#e91929 gui=none"

exec "highlight TODO           term=bold cterm=none ctermfg=". s:black ." ctermbg=". s:yellow ." guifg=#242424 guibg=#d7ff87 gui=bold"

""" set plugin specific colors

" vem-statusline
exec "highlight VemStatusLineMode          term=reverse cterm=bold ctermfg=". s:yellow ." ctermbg=". s:borders ." guifg=#cae682 guibg=#373737 gui=bold"
exec "highlight VemStatusLineModeInsert    term=reverse cterm=bold ctermfg=". s:yellow ." ctermbg=". s:borders ." guifg=#cae682 guibg=#373737 gui=bold"
exec "highlight VemStatusLineBranch        term=reverse cterm=none ctermfg=". s:grey   ." ctermbg=". s:borders ." guifg=#999999 guibg=#373737 gui=none"
exec "highlight VemStatusLineFileModified  term=reverse cterm=bold ctermfg=". s:yellow ." ctermbg=". s:borders ." guifg=#cae682 guibg=#373737 gui=bold"
exec "highlight VemStatusLineFileRO        term=reverse cterm=bold ctermfg=". s:red    ." ctermbg=". s:borders ." guifg=#e5786d guibg=#373737 gui=bold"
exec "highlight VemStatusLineSeparator     term=reverse cterm=none ctermfg=". s:grey   ." ctermbg=". s:borders ." guifg=#999999 guibg=#373737 gui=none"
exec "highlight VemStatusLinePosition      term=reverse cterm=bold ctermfg=". s:white  ." ctermbg=". s:borders ." guifg=#f6f3e8 guibg=#373737 gui=bold"

" vem-tabline
exec "highlight VemTablineNormal           term=reverse cterm=none ctermfg=". s:tabline_fg ." ctermbg=". s:tabline_bg ." guifg=#242424 guibg=#cdcdcd gui=none"
exec "highlight VemTablineLocation         term=reverse cterm=none ctermfg=". s:tabline_location ." ctermbg=". s:tabline_bg ." guifg=#666666 guibg=#cdcdcd gui=none"
exec "highlight VemTablineNumber           term=reverse cterm=none ctermfg=". s:tabline_location ." ctermbg=". s:tabline_bg ." guifg=#666666 guibg=#cdcdcd gui=none"
exec "highlight VemTablineSelected         term=bold cterm=bold ctermfg=". s:black ." ctermbg=". s:white ." guifg=#242424 guibg=#ffffff gui=bold"
exec "highlight VemTablineLocationSelected term=bold cterm=none ctermfg=". s:tabline_location ." ctermbg=". s:white ." guifg=#666666 guibg=#ffffff gui=bold"
exec "highlight VemTablineNumberSelected   term=bold cterm=none ctermfg=". s:tabline_location ." ctermbg=". s:white ." guifg=#666666 guibg=#ffffff gui=bold"
exec "highlight VemTablineShown            term=reverse cterm=none ctermfg=". s:tabline_fg ." ctermbg=". s:tabline_bg ." guifg=#242424 guibg=#cdcdcd gui=none"
exec "highlight VemTablineLocationShown    term=reverse cterm=none ctermfg=". s:tabline_fg ." ctermbg=". s:tabline_bg ." guifg=#666666 guibg=#cdcdcd gui=none"
exec "highlight VemTablineNumberShown      term=reverse cterm=none ctermfg=". s:tabline_fg ." ctermbg=". s:tabline_bg ." guifg=#666666 guibg=#cdcdcd gui=none"
exec "highlight VemTablineSeparator        term=reverse cterm=none ctermfg=". s:grey ." ctermbg=". s:tabline_bg ." guifg=#888888 guibg=#cdcdcd gui=" . s:italic
exec "highlight VemTablinePartialName      term=reverse cterm=none ctermfg=". s:grey ." ctermbg=". s:tabline_bg ." guifg=#888888 guibg=#cdcdcd gui=" . s:italic
exec "highlight VemTablineTabNormal        term=reverse cterm=none ctermfg=". s:tabline_fg ." ctermbg=". s:tabline_bg ." guifg=#cdcdcd guibg=#4a4a4a gui=none"
exec "highlight VemTablineTabSelected      term=bold cterm=bold ctermfg=". s:black ." ctermbg=". s:white ." guifg=#242424 guibg=#ffffff gui=bold"

" ctrl-p
exec "highlight CtrlPStatusline            term=bold cterm=bold ctermfg=". s:grey ." ctermbg=" . s:bg . " guifg=#999999 guibg=NONE gui=none"
exec "highlight CtrlPBufferNr              term=none cterm=none ctermfg=". s:blue ." ctermbg=" . s:bg . " guifg=#8ac6f2 guibg=NONE gui=none"
exec "highlight CtrlPNoEntries             term=none cterm=none ctermfg=". s:intense_red ." ctermbg=" . s:bg . " guifg=#ee0000 guibg=NONE gui=none"
exec "highlight CtrlPMatch                 term=bold cterm=none ctermfg=". s:yellow ." ctermbg=" . s:bg . " guifg=#cae682 guibg=NONE gui=none"

