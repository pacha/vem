" Vem: functions to handle different keyboard layouts

let s:layout_mappings = {
    \   "qwerty": {
    \       "y": {
    \           "n": "\<Plug>vem_add_line_above-",
    \           "x": "\<Plug>vem_add_line_above-",
    \       },
    \       "Y": {
    \           "n": "\<Plug>vem_quickfix_prev_result-",
    \           "x": "\<Plug>vem_quickfix_prev_result-",
    \       },
    \       "z": {
    \           "n": "\<Plug>vem_bottom-",
    \           "x": "\<Plug>vem_bottom-",
    \       },
    \       "Z": {
    \           "n": "\<Plug>vem_scroll_down-",
    \           "x": "\<Plug>vem_scroll_down-",
    \       },
    \   },
    \   "qwertz": {
    \       "y": {
    \           "n": "\<Plug>vem_bottom-",
    \           "x": "\<Plug>vem_bottom-",
    \       },
    \       "Y": {
    \           "n": "\<Plug>vem_scroll_down-",
    \           "x": "\<Plug>vem_scroll_down-",
    \       },
    \       "z": {
    \           "n": "\<Plug>vem_add_line_above-",
    \           "x": "\<Plug>vem_add_line_above-",
    \       },
    \       "Z": {
    \           "n": "\<Plug>vem_quickfix_prev_result-",
    \           "x": "\<Plug>vem_quickfix_prev_result-",
    \       },
    \   },
    \ }

" Return mapping (as string) for the given keypress in the given layout
" (only used for keys that change across the supported layouts)
function! vem#layouts#dispatch(layout, keypress, mode) abort

    " get mapping for current layout
    try
        let layout_mapping = s:layout_mappings[a:layout]
    catch /E716:/
        let layout_names = join(keys(g:layout_mappings), ', ')
        echoerr 'Vem: keyboard layout ' . a:layout . ' not known. '
            \ 'Supported layouts: ' . layout_names
        return ''
    endtry

    " get mapping for keypress
    let keypress_mapping = layout_mapping[a:keypress]

    " return action according to mode
    return keypress_mapping[a:mode]

endfunction

