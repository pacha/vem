" Description: debug functions for Vem

" display all elements of the current runtimepath in new buffer
function! vem#debug#show_runtimepath() abort
    enew
    put=execute('echo &runtimepath')
    %s/,/\r/g
    g/^$/d
endfunction

" display non-vem key mappings in new buffer
function! vem#debug#show_non_vem_keymappings() abort
    enew
    put=execute('map')

    " delete empty lines
    g/^$/d

    " delete <Plug> definitions
    g/^...<Plug>/d

    " delete select mode key mappings
    g/^s/d

    " delete Vem key mappings
    g/\ vem#/d
    g/<Plug>vem_/d
endfunction

