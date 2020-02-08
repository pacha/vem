" Vem: delete and change

" Delete
noremap <Plug>vem_delete- x
nnoremap <Plug>vem_backspace- X
vnoremap <Plug>vem_backspace- x

" Delete line
noremap <Plug>vem_delete_line- dd
noremap <Plug>vem_delete_inner_line- ^vg_c

" Delete to the ends of the line
nnoremap <Plug>vem_delete_eol- d$
nnoremap <Plug>vem_delete_bol- d^

" Delete current word and go into insert mode
nnoremap <Plug>vem_change_word- ciw

" Delete selection and go into insert mode
nnoremap <Plug>vem_change- cc
vnoremap <Plug>vem_change- c

" Delete to the ends of the line and go into insert mode
nnoremap <Plug>vem_change_eol- C
nnoremap <Plug>vem_change_bol- d^i

" Delete between surroundings
nmap <silent> <Plug>vem_change_surrounded_text- <Plug>(wildfire-fuel)<Plug>vem_change-

" Delete camel case
noremap <Plug>vem_vim_c- c
nmap <Plug>vem_camelcase_change- <Plug>vem_vim_c-<Plug>CamelCaseMotion_ie
