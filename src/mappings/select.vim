" Vem: selections

" Start visual mode
nnoremap <Plug>vem_start_char_selection- v
nnoremap <Plug>vem_start_block_selection- <C-v>
nnoremap <Plug>vem_start_line_selection- V

" Select between surroundings
map <Plug>vem_increase_selection- <Plug>(wildfire-fuel)
map <Plug>vem_decrease_selection- <Plug>(wildfire-water)

" Move cursor to the ends of selection
vnoremap <Plug>vem_toggle_selection_end- o

" Change selection mode
vnoremap <expr> <Plug>vem_change_selection_mode- vem#select#change_selection_mode()

" Increase word selection
vnoremap <silent> <Plug>vem_increase_word_selection_left- :<C-U>call vem#select#increase_word_selection('left', 0)<CR>
vnoremap <silent> <Plug>vem_increase_word_selection_right- :<C-U>call vem#select#increase_word_selection('right', 0)<CR>
vnoremap <silent> <Plug>vem_increase_camelcase_selection_left- :<C-U>call vem#select#increase_word_selection('left', 1)<CR>
vnoremap <silent> <Plug>vem_increase_camelcase_selection_right- :<C-U>call vem#select#increase_word_selection('right', 1)<CR>

" Reselect last selection
nnoremap <Plug>vem_reselect- gv

" Deselect
vnoremap <Plug>vem_deselect- <Esc>

" Select last pasted or inserted text
noremap <expr> <Plug>vem_select_last_pasted_text- "`[" . strpart(getregtype(), 0, 1) . "`]"

" Select camel case
noremap <Plug>vem_vim_v- v
map <Plug>vem_camelcase_select- <Plug>vem_vim_v-<Plug>CamelCaseMotion_ie
