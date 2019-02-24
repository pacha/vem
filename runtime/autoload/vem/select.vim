
" change the visual selection type (to be used in an <expr> mapping)
function! vem#select#change_selection_mode() abort
    let current_mode = mode()
    if current_mode ==# "v"
        return "\<C-v>"
    elseif current_mode ==# "V"
        return "v"
    else
        return "V"
endfunction

" increase the visual selection jumping to word boundaries
function! vem#select#increase_word_selection(direction) abort

    " restore select mode
    normal! gv

    " get selection and cursor positions
    let start_selection_offset = line2byte(line("'<")) + col("'<")
    let end_selection_offset = line2byte(line("'>")) + col("'>")
    let cursor_offset = line2byte(line(".")) + col(".")

    " make selection
    if a:direction == 'left'
        if cursor_offset == start_selection_offset
            exec "normal \<Plug>(smartword-b)"
        else
            exec "normal \<Plug>(smartword-ge)"

            " correct position if the left boundary has been surpassed
            let new_cursor_offset = line2byte(line(".")) + col(".")
            if new_cursor_offset < start_selection_offset
                exec "normal \<Plug>(smartword-w)"
            endif
        endif
    else
        if cursor_offset == end_selection_offset
            exec "normal \<Plug>(smartword-e)"
        else
            exec "normal \<Plug>(smartword-w)"

            " correct position if the right boundary has been surpassed
            let new_cursor_offset = line2byte(line(".")) + col(".")
            if new_cursor_offset > end_selection_offset
                exec "normal \<Plug>(smartword-ge)"
            endif
        endif
    endif

endfunction

