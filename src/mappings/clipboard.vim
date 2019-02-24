" Vem: clipboard

" Copy
nnoremap <expr> <Plug>vem_copy- '"' . g:vem_main_clipboard . 'yy'
vnoremap <expr> <Plug>vem_copy- '"' . g:vem_main_clipboard . 'y'
nnoremap <expr> <Plug>vem_copy_aux- '"' . g:vem_aux_clipboard . 'yy'
vnoremap <expr> <Plug>vem_copy_aux- '"' . g:vem_aux_clipboard . 'y'

" Cut
nnoremap <expr> <Plug>vem_cut- '"' . g:vem_main_clipboard . 'dd'
vnoremap <expr> <Plug>vem_cut- '"' . g:vem_main_clipboard . 'd'
nnoremap <expr> <Plug>vem_cut_aux- '"' . g:vem_aux_clipboard . 'dd'
vnoremap <expr> <Plug>vem_cut_aux- '"' . g:vem_aux_clipboard . 'd'

" Paste
noremap <expr> <Plug>vem_paste_before- '"' . g:vem_main_clipboard . 'P'
noremap <expr> <Plug>vem_paste_before_aux- '"' . g:vem_aux_clipboard . 'P'

noremap <expr> <Plug>vem_paste_after- '"' . g:vem_main_clipboard . 'p'
noremap <expr> <Plug>vem_paste_after_aux- '"' . g:vem_aux_clipboard . 'p'

nnoremap <expr> <Plug>vem_paste_above- 'mx:put! ' . g:vem_main_clipboard .'<CR>`x'
nnoremap <expr> <Plug>vem_paste_above_aux- 'mx:put! ' . g:vem_aux_clipboard .'<CR>`x'

nnoremap <expr> <Plug>vem_paste_below- 'mx:put ' . g:vem_main_clipboard .'<CR>`x'
nnoremap <expr> <Plug>vem_paste_below_aux- 'mx:put ' . g:vem_aux_clipboard .'<CR>`x'

nnoremap <expr> <Plug>vem_paste_bol- 'mx^"' . g:vem_main_clipboard . 'P`x'
nnoremap <expr> <Plug>vem_paste_bol_aux- 'mx^"' . g:vem_aux_clipboard . 'P`x'

nnoremap <expr> <Plug>vem_paste_eol- 'mx$"' . g:vem_main_clipboard . 'p`x'
nnoremap <expr> <Plug>vem_paste_eol_aux- 'mx$"' . g:vem_aux_clipboard . 'p`x'

" Paste in cmd
cnoremap <expr> <Plug>vem_paste_cmd- '<C-r>' . g:vem_main_clipboard

" Paste according to indentation
nnoremap <expr> <Plug>vem_paste_indenting_above- 'mx$"' . g:vem_main_clipboard . ']P`x'
nnoremap <expr> <Plug>vem_paste_indenting_below- 'mx$"' . g:vem_main_clipboard . ']p`x'
nnoremap <expr> <Plug>vem_paste_indenting_above_aux- 'mx$"' . g:vem_aux_clipboard . ']P`x'
nnoremap <expr> <Plug>vem_paste_indenting_below_aux- 'mx$"' . g:vem_aux_clipboard . ']p`x'

