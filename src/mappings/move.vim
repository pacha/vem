" Vem: move

" Top/Bottom of document
nnoremap <Plug>vem_top- gg
vnoremap <expr> <Plug>vem_top- vem#move#selection_started() ? 'Vgg' : 'gg'

nnoremap <Plug>vem_bottom- G
vnoremap <expr> <Plug>vem_bottom- vem#move#selection_started() ? 'VG' : 'G'

" Go up/down
nnoremap <Plug>vem_up- gk
vnoremap <expr> <Plug>vem_up- vem#move#selection_started() ? 'V' : 'gk'

nnoremap <Plug>vem_down- gj
vnoremap <expr> <Plug>vem_down- vem#move#selection_started() ? 'V' : 'gj'

" Go left/right
noremap <Plug>vem_left- h
noremap <Plug>vem_right- l

" Page up/down
nnoremap <Plug>vem_page_up- <C-b>
vnoremap <expr> <Plug>vem_page_up- vem#move#selection_started() ? "V\<C-b>" : "\<C-b>"

nnoremap <Plug>vem_page_down- <C-f>
vnoremap <expr> <Plug>vem_page_down- vem#move#selection_started() ? "V\<C-f>" : "\<C-f>"

" Half page up/down
nnoremap <Plug>vem_half_page_up- <C-u>
vnoremap <expr> <Plug>vem_half_page_up- vem#move#selection_started() ?  "V\<C-u>" : "\<C-u>"

nnoremap <Plug>vem_half_page_down- <C-d>
vnoremap <expr> <Plug>vem_half_page_down- vem#move#selection_started() ?  "V\<C-d>" : "\<C-d>"

" Word left/right
nmap <Plug>vem_word_left- <Plug>(smartword-b)
nmap <Plug>vem_word_right- <Plug>(smartword-w)

" Paragraph up/down
nnoremap <Plug>vem_paragraph_up- {
vnoremap <expr> <Plug>vem_paragraph_up- vem#move#selection_started() ? 'V{' : '{'

nnoremap <Plug>vem_paragraph_down- }
vnoremap <expr> <Plug>vem_paragraph_down- vem#move#selection_started() ? 'V}' : '}'

" Alternate sides of a pasted or changed text
nnoremap <expr> <Plug>vem_last_edited_text_end- vem#move#jump_to_last_edited_text_end()
vnoremap <expr> <Plug>vem_last_edited_text_end- vem#move#jump_to_last_edited_text_end()
nnoremap <expr> <Plug>vem_last_selected_text_end- vem#move#jump_to_last_selected_text_end()

" Go to last editing place
noremap <Plug>vem_goto_last_edit- `.

" Go to end of word
nnoremap <Plug>vem_goto_eow- e
vnoremap <Plug>vem_goto_eow- e
nnoremap <Plug>vem_goto_eonw- E
vnoremap <Plug>vem_goto_eonw- E

" Go to end of line
nnoremap <Plug>vem_goto_eol- $
vnoremap <Plug>vem_goto_eol- $h

" Go to beginning of line (first non-blank)
noremap <Plug>vem_goto_bol- ^

inoremap <Plug>vem_goto_bol- <C-o>0
inoremap <Plug>vem_goto_eol- <C-o>$
cnoremap <Plug>vem_goto_bol- <C-b>
cnoremap <Plug>vem_goto_eol- <C-e>

" Go to column 0
noremap <Plug>vem_goto_first_column- 0

" Go to matching surrounding pair
nmap <Plug>vem_goto_matching_pair- <Plug>(MatchitNormalForward)
vmap <Plug>vem_goto_matching_pair- <Plug>(MatchitVisualForward)

" Move within window
noremap <Plug>vem_goto_win_top- H
noremap <Plug>vem_goto_win_middle- M
noremap <Plug>vem_goto_win_bottom- L

" Camel case movements
nmap <Plug>vem_camelcase_next- <Plug>CamelCaseMotion_w
nmap <Plug>vem_camelcase_prev- <Plug>CamelCaseMotion_b

