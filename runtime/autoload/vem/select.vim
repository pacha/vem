
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
function! vem#select#increase_word_selection(direction, camelcase) abort

    " restore select mode
    normal! gv

    if a:camelcase
        let prefix = "\<Plug>CamelCaseMotion_"
        let suffix = ""
    else
        let prefix = "\<Plug>(smartword-"
        let suffix = ")"
    endif

    " get selection and cursor positions
    let start_selection_offset = line2byte(line("'<")) + col("'<")
    let end_selection_offset = line2byte(line("'>")) + col("'>")
    let cursor_offset = line2byte(line(".")) + col(".")

    " make selection
    if a:direction == 'left'
        if cursor_offset == start_selection_offset
            exec "normal " . prefix . "b" . suffix
        else
            exec "normal " . prefix . "ge" . suffix

            " correct position if the left boundary has been surpassed
            let new_cursor_offset = line2byte(line(".")) + col(".")
            if new_cursor_offset < start_selection_offset
                exec "normal " . prefix . "w" . suffix
            endif
        endif
    else
        if cursor_offset == end_selection_offset
            exec "normal " . prefix . "e" . suffix
        else
            exec "normal " . prefix . "w" . suffix

            " correct position if the right boundary has been surpassed
            let new_cursor_offset = line2byte(line(".")) + col(".")
            if new_cursor_offset > end_selection_offset
                exec "normal " . prefix . "ge" . suffix
            endif
        endif
    endif

endfunction

