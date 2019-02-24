" Vem StatusLine
" Andrés Sopeña

" labels for modes
let s:mode_labels = {
      \    'n': 'Normal', 'i': 'Insert', 'R': 'Replace', 'v': 'Visual', 'V': 'V-Line', "\<C-v>": 'V-Block',
      \    'c': 'Command', 's': 'Select', 'S': 'S-Line', "\<C-s>": 'S-Block', 't': 'Terminal'
      \}

" labels for types of line breaks
let s:newline_labels = {'unix': 'LF', 'mac': 'CR', 'dos': 'CRLF'}

" statusline parts
let s:show_mode = stridx(g:vem_statusline_parts, 'm') != -1
let s:show_branch = stridx(g:vem_statusline_parts, 'b') != -1
let s:show_filename = stridx(g:vem_statusline_parts, 'f') != -1
let s:show_indent = stridx(g:vem_statusline_parts, 'i') != -1
let s:show_encoding = stridx(g:vem_statusline_parts, 'e') != -1
let s:show_newline = stridx(g:vem_statusline_parts, 'n') != -1
let s:show_position = stridx(g:vem_statusline_parts, 'p') != -1
let s:show_progress = stridx(g:vem_statusline_parts, 'P') != -1

" statusline separators
let s:mode_separator = g:vem_statusline_mode_separator
let s:branch_separator = s:show_filename ? g:vem_statusline_branch_separator : ''
let s:right_separator = g:vem_statusline_right_separator

" Build the string to show as statusline
function! vem_statusline#render()

    let active_window = winnr()
    let statusline = ""

    " mode
    if s:show_mode
        let statusline .= "%#VemStatusLineMode#%{vem_statusline#show_mode(". active_window .", '', 'i')}%*"
        let statusline .= "%#VemStatusLineModeInsert#%{vem_statusline#show_mode(". active_window .", 'i', '')}%*"
        if s:show_filename || s:show_branch
            let statusline .= "%#VemStatusLineSeparator#%{". active_window ." == winnr() ? '". s:mode_separator ."' : ''}%*"
            let statusline .= "%<"
        endif
    endif

    " branch
    if s:show_branch
        let statusline .= "%#VemStatusLineBranch#%{vem_statusline#show_branch(". active_window .", '". s:branch_separator."')}%*"
    endif

    " filename
    let statusline .= "%{vem_statusline#show_filename(". active_window .", ". s:show_filename .")}"
    let statusline .= "%#VemStatusLineFileModified#%{". active_window ." == winnr() && ". s:show_filename ." && &modified ? '*' : ''}%*"
    let statusline .= "%#VemStatusLineFileRO#%{". active_window ." == winnr() && ". s:show_filename ." && &readonly ? '\ \ [RO]' : ''}%*"
    let statusline .= "%{". active_window ." != winnr() && &modified ? '*' : ''}"

    " align right
    let statusline .= "%=\ "

    " indent
    if s:show_indent
        let statusline .= "%{vem_statusline#show_indent(". active_window .")}"
        if s:show_encoding || s:show_newline
            let statusline .= "%#VemStatusLineSeparator#%{". active_window ." == winnr() ? '|' : ''}%*"
        endif
    endif

    " encoding
    if s:show_encoding
        let statusline .= "%{vem_statusline#show_encoding(". active_window .")}"
        if s:show_newline
            let statusline .= "%#VemStatusLineSeparator#%{". active_window ." == winnr() ? '|' : ''}%*"
        endif
    endif

    " newline
    if s:show_newline
        let statusline .= "%{vem_statusline#show_newline(". active_window .")}"
        if s:show_position
            let statusline .= "\ \ "
        endif
    endif

    " position
    if s:show_position
        let statusline .= "%#VemStatusLinePosition#%{vem_statusline#show_position(". active_window .")}%*"
        if s:show_progress
            let statusline .= "\ \ "
        endif
    endif

    " progress
    if s:show_progress
        let statusline .= "%#VemStatusLinePosition#%{vem_statusline#show_progress(". active_window .")}%*"
    endif

    return statusline

endfunction

function! vem_statusline#show_mode(active_window, include, exclude)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    " show mode
    let active_mode = mode()
    if !empty(a:include) && stridx(a:include, active_mode) == -1
        return ''
    endif
    if !empty(a:exclude) && stridx(a:exclude, active_mode) != -1
        return ''
    endif
    let mode_label = get(s:mode_labels, active_mode, active_mode)
    let paste_label = &paste ? ' (paste)' : ''
    return mode_label . paste_label
endfunction

function! vem_statusline#show_branch(active_window, separator)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    " show branch name
    if exists('g:vem_statusline_branch_function') && g:vem_statusline_branch_function != ''
        try
            let branch_name = function(g:vem_statusline_branch_function)()
        catch /E700:/
            let msg = "vem-statusline: function '" . g:vem_statusline_branch_function
            let msg .= "' to retrieve branch name doesn't exist. Check your configuration."
            echomsg msg
            let branch_name = ''
        endtry
    else
        if exists('*gitbranch#name')
            " for https://github.com/itchyny/vim-gitbranch
            let branch_name = gitbranch#name()
        elseif exists('*fugitive#head')
            " for https://github.com/tpope/vim-fugitive
            let branch_name = fugitive#head()
        else
            let branch_name = ''
        endif
    endif
    return branch_name != '' ? branch_name . a:separator : ''
endfunction

function! vem_statusline#show_filename(active_window, show_filename)
    " don't show in non-active window
    if a:active_window != winnr() || a:show_filename

        if g:vem_statusline_filename_format == 'P'
            let filename = vem_statusline#filename_format#get_name_relative_to_project_root()
        else
            let filename = expand("%:" . g:vem_statusline_filename_format)
        endif

        if filename != ''
            return filename
        else
            return "[No Name]"
        endif
    else
        return ''
    endif
endfunction

function! vem_statusline#show_indent(active_window)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    " show indent
    if &expandtab
        let indent_type = "spaces"
    else
        if &softtabstop % &tabstop == 0
            let indent_type = "tabs"
        else
            let indent_type = "tabs+spaces"
        endif
    endif
    let indent_size = &softtabstop
    return indent_type . ":" . indent_size
endfunction

function! vem_statusline#show_encoding(active_window)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    " show encoding
    return &fileencoding != '' ? &fileencoding : (&encoding != '' ? &encoding : "--")
endfunction

function! vem_statusline#show_newline(active_window)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    " show newline
    return get(s:newline_labels, &fileformat, &fileformat)
endfunction

function! vem_statusline#show_position(active_window)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    " show newline
    return printf('%3d:%-2d', line('.'), col('.'))
endfunction

function! vem_statusline#show_progress(active_window)
    " don't show in non-active window
    if a:active_window != winnr()
        return ''
    endif
    let current_line = line('.')
    let last_line = line('$')
    " show progress
    if line('w0') == 1 && last_line <= line('w$')
        return 'All'
    endif
    let percentage = float2nr((current_line * 1.0 / last_line) * 100)
    if percentage == 0 || current_line == 1
        return 'Top'
    elseif percentage == 100
        return 'Bottom'
    else
        return printf("%2d%%", percentage)
    endif
endfunction

