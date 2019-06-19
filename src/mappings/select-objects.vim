" Vem: select objects

" Select whole document
nnoremap <Plug>vem_select_all- ggVG
vnoremap <Plug>vem_select_all- <Esc>ggVG

" Select word
nnoremap <Plug>vem_inner_select_word- viw
vnoremap <Plug>vem_inner_select_word- iw
nnoremap <Plug>vem_outer_select_word- vaw
vnoremap <Plug>vem_outer_select_word- aw

" Select non-whitespace characters
nnoremap <Plug>vem_inner_select_non_whitespace- viW
vnoremap <Plug>vem_inner_select_non_whitespace- iW
vnoremap <Plug>vem_inner_reselect_non_whitespace- <Esc>viW
nnoremap <Plug>vem_outer_select_non_whitespace- vaW
vnoremap <Plug>vem_outer_select_non_whitespace- aW

" Select line
nnoremap <Plug>vem_inner_select_line- ^vg_
vnoremap <Plug>vem_inner_select_line- <Esc>^vg_
nnoremap <Plug>vem_outer_select_line- 0vg_
vnoremap <Plug>vem_outer_select_line- <Esc>0vg_

" Select sentence
nnoremap <Plug>vem_inner_select_sentence- vis
vnoremap <Plug>vem_inner_select_sentence- is
nnoremap <Plug>vem_outer_select_sentence- vas
vnoremap <Plug>vem_outer_select_sentence- as

" Select paragraph
nnoremap <Plug>vem_inner_select_paragraph- vip
vnoremap <Plug>vem_inner_select_paragraph- ip
nnoremap <Plug>vem_outer_select_paragraph- vap
vnoremap <Plug>vem_outer_select_paragraph- ap

" Select block
nnoremap <Plug>vem_inner_select_block- vib
vnoremap <Plug>vem_inner_select_block- ib
nnoremap <Plug>vem_outer_select_block- vab
vnoremap <Plug>vem_outer_select_block- ab
nnoremap <Plug>vem_inner_select_full_block- viB
vnoremap <Plug>vem_inner_select_full_block- iB
nnoremap <Plug>vem_outer_select_full_block- vaB
vnoremap <Plug>vem_outer_select_full_block- aB

" Select between parenthesis
nnoremap <Plug>vem_inner_select_parens- vi(
vnoremap <Plug>vem_inner_select_parens- i(
nnoremap <Plug>vem_outer_select_parens- va(
vnoremap <Plug>vem_outer_select_parens- a(

" Select between braces
nnoremap <Plug>vem_inner_select_braces- vi{
vnoremap <Plug>vem_inner_select_braces- i{
nnoremap <Plug>vem_outer_select_braces- va{
vnoremap <Plug>vem_outer_select_braces- a{

" Select between square brackets
nnoremap <Plug>vem_inner_select_brackets- vi[
vnoremap <Plug>vem_inner_select_brackets- i[
nnoremap <Plug>vem_outer_select_brackets- va[
vnoremap <Plug>vem_outer_select_brackets- a[

" Select between angle brackets
nnoremap <Plug>vem_inner_select_angle_brackets- vi<
vnoremap <Plug>vem_inner_select_angle_brackets- i<
nnoremap <Plug>vem_outer_select_angle_brackets- va<
vnoremap <Plug>vem_outer_select_angle_brackets- a<

" Select between tags
nnoremap <Plug>vem_inner_select_tags- vit
vnoremap <Plug>vem_inner_select_tags- it
nnoremap <Plug>vem_outer_select_tags- vat
vnoremap <Plug>vem_outer_select_tags- at

" Select between single quotes
nnoremap <Plug>vem_inner_select_single_quotes- vi'
vnoremap <Plug>vem_inner_select_single_quotes- i'
nnoremap <Plug>vem_outer_select_single_quotes- v2i'
vnoremap <Plug>vem_outer_select_single_quotes- 2i'

" Select between double quotes
nnoremap <Plug>vem_inner_select_double_quotes- vi"
vnoremap <Plug>vem_inner_select_double_quotes- i"
nnoremap <Plug>vem_outer_select_double_quotes- v2i"
vnoremap <Plug>vem_outer_select_double_quotes- 2i"

" Select between backstitck quotes
nnoremap <Plug>vem_inner_select_backsticks- vi`
vnoremap <Plug>vem_inner_select_backsticks- i`
nnoremap <Plug>vem_outer_select_backsticks- v2i`
vnoremap <Plug>vem_outer_select_backsticks- 2i`

