
" Count the number of windows which display the given buffer
function! s:win_countbuf(buffer_nr) abort
    let win_count = 0
    for tabpage_nr in range(1, tabpagenr('$'))
        let win_count += len(filter(tabpagebuflist(tabpage_nr), 'v:val==a:buffer_nr'))
    endfor
    return win_count
endfunction

" close current buffer/window/tabpage
function! vem#buffers#smart_close() abort
    " buffer to act upon
    let current_buffer = bufnr('%')

    " if last buffer in last window, quit
    let listed_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let last_listed = len(listed_buffers) == 1 && current_buffer == listed_buffers[0]
    let last_tabpage = tabpagenr('$') == 1
    let last_window = winnr('$') == 1
    if last_listed && last_tabpage && last_window
        confirm quit
        return
    endif

    " if shown in more than one window, close
    if exists("*win_findbuf")
        let num_windows = len(win_findbuf(current_buffer))
    else
        let num_windows = s:win_countbuf(current_buffer)
    endif
    if num_windows > 1
        close
        return
    endif

    " if only shown in one window, delete
    try
        let next_buffer = g:vem_tabline#tabline.get_replacement_buffer()
        exec 'confirm ' . current_buffer . 'bdelete'
        if next_buffer != 0
            exec next_buffer . 'buffer'
        endif
    catch /E516:/
       " If you cancel the operation, don't do anything
    endtry

endfunction

" display next buffer (in buffer list or tabline)
function! vem#buffers#goto_next_buffer() abort
    " check if the mapping from vem-tabline is available
    if !empty(maparg('<Plug>vem_next_buffer-', 'n'))
        return "\<Plug>vem_next_buffer-"
    else
        return ":\<C-u>bnext\<CR>"
    endif
endfunction

" display previous buffer (in buffer list or tabline)
function! vem#buffers#goto_prev_buffer() abort
    " check if the mapping from vem-tabline is available
    if !empty(maparg('<Plug>vem_prev_buffer-', 'n'))
        return "\<Plug>vem_prev_buffer-"
    else
        return ":\<C-u>bprev\<CR>"
    endif
endfunction

