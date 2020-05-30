" Description: insert mode functions for Vem

" insert tab at the beginning of line or after whitespace
" complete word otherwhise
" direction: 'next' | 'prev'
function! vem#insert#smarttab(direction) abort
    " insert tab after whitespace
    let col = col('.') - 1
    if !col || getline('.')[col - 1]  =~# '\s'
        return "\<Tab>"
    endif

    " complete otherwise
    return a:direction == 'next' ? "\<C-n>" : "\<C-p>"
endfunction

