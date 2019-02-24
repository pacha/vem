" Vem: miscelanea

" Cancel command
noremap <Plug>vem_nop- <Esc>

" Repeat
noremap <Plug>vem_repeat- .

" Redraw screen and clear last search highlighting
nnoremap <silent> <Plug>vem_redraw- :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Vim escape
noremap <Plug>vem_g_prefix- g
noremap <Plug>vem_z_prefix- z

" Add/Substract one unit to the value under cursor
noremap <Plug>vem_add- <C-a>
noremap <Plug>vem_sub- <C-x>

" Tags
noremap <Plug>vem_go_back- <C-t>
noremap <Plug>vem_follow_tag- g<C-]>

" History
map <Plug>vem_jump_history_back- <Plug>EnhancedJumpsLocalOlder
map <Plug>vem_jump_history_forward- <Plug>EnhancedJumpsLocalNewer

