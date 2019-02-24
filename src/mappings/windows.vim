" Vem: windows

" Move cursor to different window
noremap <silent> <Plug>vem_win_up- <C-w>k
noremap <silent> <Plug>vem_win_down- <C-w>j
noremap <silent> <Plug>vem_win_left- <C-w>h
noremap <silent> <Plug>vem_win_right- <C-w>l

noremap <silent> <Plug>vem_last_accessed_window- <C-w>p

" New window
noremap <silent> <Plug>vem_new_win_up- :<C-U>aboveleft new<CR>
noremap <silent> <Plug>vem_new_win_left- :<C-U>aboveleft vnew<CR>
noremap <silent> <Plug>vem_new_win_down- :<C-U>belowright new<CR>
noremap <silent> <Plug>vem_new_win_right- :<C-U>belowright vnew<CR>

" Clone window
noremap <silent> <Plug>vem_clone_win_up- :<C-U>aboveleft split<CR>
noremap <silent> <Plug>vem_clone_win_left- :<C-U>aboveleft vsplit<CR>
noremap <silent> <Plug>vem_clone_win_down- :<C-U>belowright split<CR>
noremap <silent> <Plug>vem_clone_win_right- :<C-U>belowright vsplit<CR>

" Move window
noremap <silent> <Plug>vem_move_win_top- <C-w>K
noremap <silent> <Plug>vem_move_win_bottom- <C-w>J
noremap <silent> <Plug>vem_move_win_left- <C-w>H
noremap <silent> <Plug>vem_move_win_right- <C-w>L

" Rotate windows
nnoremap <silent> <Plug>vem_rotate_window_up- <C-w>r
nnoremap <silent> <Plug>vem_rotate_window_down- <C-w>R

" Change size
noremap <silent> <Plug>vem_increase_win_height- <C-w>+
noremap <silent> <Plug>vem_decrease_win_height- <C-w>-
noremap <silent> <Plug>vem_increase_win_width- <C-w>>
noremap <silent> <Plug>vem_decrease_win_width- <C-w><

" Set the current window like the only one in current tabpage
noremap <silent> <Plug>vem_only_window- <C-w>o

" Close window
noremap <silent> <Plug>vem_close_window- <C-w>c

