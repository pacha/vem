" Vem: undo

" Undo
nnoremap <Plug>vem_undo- u
vnoremap <Plug>vem_undo- <Esc>u

" Undo line
nnoremap <Plug>vem_undo_line- U
vnoremap <Plug>vem_undo_line- <Esc>U

" Redo
nnoremap <Plug>vem_redo- <C-r>
vnoremap <Plug>vem_redo- <Esc><C-r>

" Undo all changes (changes in the last 24 hours)
noremap <silent> <Plug>vem_undo_all- :<C-u>earlier 24h<CR>

" Redo all changes (more than 24h ahead)
noremap <silent> <Plug>vem_redo_all- :<C-u>later 25h<CR>


