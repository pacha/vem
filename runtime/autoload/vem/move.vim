
" check if the visual selection is a one character and characterwise one
function! vem#move#selection_started() abort
    let charwise = mode() ==# "v"
    let same_pos = getpos("v") == getpos(".")
    return charwise && same_pos
endfunction

" jump to the beginning/end of the last edited text
function! vem#move#jump_to_last_edited_text_end() abort
    if getpos(".") == getpos("']")
        return "`["
    else
        return "`]"
    endif
endfunction

" jump to the beginning/end of the last selected text
function! vem#move#jump_to_last_selected_text_end() abort
    if getpos(".") == getpos("'>")
        return "`<"
    else
        return "`>"
    endif
endfunction

