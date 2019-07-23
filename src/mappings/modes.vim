" Vem: modes

" Go to normal mode
noremap <Plug>vem_normal_mode- <Esc>
noremap! <Plug>vem_normal_mode- <Esc>

" Replace mode
noremap <Plug>vem_replace_mode- R

" Exit command line
cnoremap <Plug>vem_exit_command_line- <C-c>

" Go to insert mode (to the left of current character)
nnoremap <Plug>vem_insert_left- i

" Go to insert mode (to the right of current character)
nnoremap <Plug>vem_insert_right- a

" Open a new line above the current one and change to insert mode
nnoremap <Plug>vem_insert_above- O

" Open a new line below the current one and change to insert mode
nnoremap <Plug>vem_insert_below- o

" Go to beginning of line and change to insert mode
noremap <Plug>vem_insert_start- I

" Go to end of line and change to insert mode
noremap <Plug>vem_insert_end- A

