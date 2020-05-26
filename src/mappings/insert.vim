" Vem: insert and command line mode

" Up/Down
inoremap <Plug>vem_up- <C-o>gk
inoremap <Plug>vem_down- <C-o>gj
cnoremap <Plug>vem_up- <Up>
cnoremap <Plug>vem_down- <Down>

" Left/Right
noremap! <Plug>vem_left- <Left>
noremap! <Plug>vem_right- <Right>

" Clone character above/below cursor
inoremap <Plug>vem_clone_char_above- <C-y>
inoremap <Plug>vem_clone_char_below- <C-e>

" Autocomplete
inoremap <Plug>vem_autocomplete_prev- <C-p>
inoremap <Plug>vem_autocomplete_next- <C-n>
inoremap <Plug>vem_cancel_completion- <C-e>

" execute a single command in normal mode
inoremap <Plug>vem_exec_normal_command- <C-o>

" insert special chars
noremap! <Plug>vem_insert_digraph- <C-k>
noremap! <Plug>vem_insert_tab- <Tab>

" Space
noremap! <Plug>vem_space- <Space>

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <Plug>vem_delete_to_eol- <C-G>u<C-U>

" Vim compatibility
cnoremap <Plug>vem_insert_matching_names- <C-a>

