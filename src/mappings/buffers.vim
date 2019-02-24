" Vem: buffers

" New buffer
noremap <silent> <Plug>vem_new_buffer- :<C-u>enew<CR>

" Open buffer
noremap <silent> <Plug>vem_file_browser- :<C-u>FileBeagleBufferDir<CR>
noremap <silent> <Plug>vem_fuzzy_finder- :<C-u>CtrlP<CR>
noremap <silent> <Plug>vem_mru- :<C-u>CtrlPMRUFiles<CR>
noremap <Plug>vem_open_file_under_cursor- gf

" Save buffer
noremap <expr> <Plug>vem_save- empty(bufname('%')) ? ":<C-u>w " . fnamemodify(getcwd(), ':p'): ":<C-u>w\<CR>"

" Switch buffer
noremap <silent> <Plug>vem_switch_buffer- :<C-u>CtrlPBuffer<CR>

" Next/Prev buffer
map <silent> <expr> <Plug>vem_goto_next_buffer- vem#buffers#goto_next_buffer()
map <silent> <expr> <Plug>vem_goto_prev_buffer- vem#buffers#goto_prev_buffer()

" Move buffer left
map <silent> <Plug>vem_shift_buffer_left- <Plug>vem_move_buffer_left-

" Move buffer right
map <silent> <Plug>vem_shift_buffer_right- <Plug>vem_move_buffer_right-

" Alternate buffer
noremap <silent> <Plug>vem_alternate_buffer- :<C-u>b#<CR>

" Smart close
noremap <silent> <Plug>vem_smart_close- :<C-U>call vem#buffers#smart_close()<CR>

" Exit
noremap <silent> <Plug>vem_exit- :confirm qall<CR>

