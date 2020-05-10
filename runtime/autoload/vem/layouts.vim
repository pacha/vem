" Vem: functions to handle different keyboard layouts

let s:layout_mappings = {
    \   "qwerty": {
    \       "q": "\<Plug>vem_undo-",
    \       "Q": "\<Plug>vem_redo-",
    \       "\<C-q>": "\<Plug>vem_scroll_up-",
    \       "a": "\<Plug>vem_top-",
    \       "A": "\<Plug>vem_add-",
    \       "\<C-a>": "\<Plug>vem_scroll_down-",
    \       "z": "\<Plug>vem_bottom-",
    \       "Z": "\<Plug>vem_sub-",
    \       "w": "\<Plug>vem_switch_buffer-",
    \       "W": "\<Plug>vem_file_browser-",
    \       "\<Plug>vem_alt-w": "\<Plug>vem_fuzzy_finder-",
    \       "\<Plug>vem_alt-W": "\<Plug>vem_mru-",
    \       "\<Plug>vem_alt-z": "\<Plug>vem_nop-",
    \       "\<Plug>vem_alt-y": "\<Plug>vem_prev_spell-",
    \       "y": "\<Plug>vem_add_line_above-",
    \       "Y": "\<Plug>vem_quickfix_prev_result-",
    \       ".": "\<Plug>vem_goto_eol-",
    \       "\<Plug>vem_alt-.": "\<Plug>vem_search_char_forward-",
    \       ";": "\<Plug>vem_goto_eow-",
    \       "\<Plug>vem_alt-;": "\<Plug>vem_goto_eonw-",
    \   },
    \   "qwertz": {
    \       "q": "\<Plug>vem_undo-",
    \       "Q": "\<Plug>vem_redo-",
    \       "\<C-q>": "\<Plug>vem_scroll_up-",
    \       "a": "\<Plug>vem_top-",
    \       "A": "\<Plug>vem_add-",
    \       "\<C-a>": "\<Plug>vem_scroll_down-",
    \       "y": "\<Plug>vem_bottom-",
    \       "Y": "\<Plug>vem_sub-",
    \       "w": "\<Plug>vem_switch_buffer-",
    \       "W": "\<Plug>vem_file_browser-",
    \       "\<Plug>vem_alt-w": "\<Plug>vem_fuzzy_finder-",
    \       "\<Plug>vem_alt-W": "\<Plug>vem_mru-",
    \       "\<Plug>vem_alt-z": "\<Plug>vem_prev_spell-",
    \       "\<Plug>vem_alt-y": "\<Plug>vem_nop-",
    \       "z": "\<Plug>vem_add_line_above-",
    \       "Z": "\<Plug>vem_quickfix_prev_result-",
    \       ".": "\<Plug>vem_goto_eol-",
    \       "\<Plug>vem_alt-.": "\<Plug>vem_search_char_forward-",
    \       ";": "\<Plug>vem_goto_eow-",
    \       "\<Plug>vem_alt-;": "\<Plug>vem_goto_eonw-",
    \   },
    \   "azerty": {
    \       "a": "\<Plug>vem_undo-",
    \       "A": "\<Plug>vem_redo-",
    \       "\<C-a>": "\<Plug>vem_scroll_up-",
    \       "q": "\<Plug>vem_top-",
    \       "Q": "\<Plug>vem_add-",
    \       "\<C-q>": "\<Plug>vem_scroll_down-",
    \       "w": "\<Plug>vem_bottom-",
    \       "W": "\<Plug>vem_sub-",
    \       "z": "\<Plug>vem_switch_buffer-",
    \       "Z": "\<Plug>vem_file_browser-",
    \       "\<Plug>vem_alt-w": "\<Plug>vem_nop-",
    \       "\<Plug>vem_alt-z": "\<Plug>vem_fuzzy_finder-",
    \       "\<Plug>vem_alt-Z": "\<Plug>vem_mru-",
    \       "\<Plug>vem_alt-y": "\<Plug>vem_prev_spell-",
    \       "y": "\<Plug>vem_add_line_above-",
    \       "Y": "\<Plug>vem_quickfix_prev_result-",
    \       ".": "\<Plug>vem_goto_eow-",
    \       "\<Plug>vem_alt-.": "\<Plug>vem_goto_eonw-",
    \       ";": "\<Plug>vem_goto_eol-",
    \       "\<Plug>vem_alt-;": "\<Plug>vem_search_char_forward-",
    \   },
    \ }

" Return mapping (as string) for the given keypress in the given layout
" (only used for keys that change across the supported layouts)
function! vem#layouts#dispatch(layout, keypress) abort

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
    let action = layout_mapping[a:keypress]

    " return action according to mode
    return action

endfunction

