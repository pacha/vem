" Vem: format

" Add line above/below
nnoremap <silent> <Plug>vem_add_line_above- :set paste<CR>mxO<Esc>`x:set nopaste<CR>
nnoremap <silent> <Plug>vem_add_line_below- :set paste<CR>mxo<Esc>`x:set nopaste<CR>

" Join lines
noremap <Plug>vem_join_lines- J

" Indent/Unindent
nnoremap <Plug>vem_unindent- <<
vnoremap <Plug>vem_unindent- <<<Esc>gv

nnoremap <Plug>vem_indent- >>
vnoremap <Plug>vem_indent- >><Esc>gv

" Enter
nnoremap <silent> <Plug>vem_enter- i<CR><Esc>

" Format lines
nnoremap <Plug>vem_format_text- gqip
vnoremap <Plug>vem_format_text- Jgvgq

" Format code
noremap <Plug>vem_format_code- =

" Toggle case
noremap <Plug>vem_toggle_case- ~

" Force uppercase
nnoremap <Plug>vem_uppercase- gUll
vnoremap <Plug>vem_uppercase- U

" Force lowercase
nnoremap <Plug>vem_lowercase- gull
vnoremap <Plug>vem_lowercase- u

