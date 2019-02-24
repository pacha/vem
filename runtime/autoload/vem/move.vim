
" check if the visual selection is a one character and characterwise one
function! vem#move#selection_started() abort
    let charwise = mode() ==# "v"
    let same_pos = getpos("v") == getpos(".")
    return charwise && same_pos
endfunction

" jump to the beginning/end of the last edited text
function! vem#move#jump_to_changed_text_end() abort
    let prev_pos = getpos(".")
    normal! ']
    if prev_pos == getpos(".")
        normal! '[
    endif
endfunction

