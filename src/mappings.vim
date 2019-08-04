" Vem: key mappings

" Special keys:
" <C-h>: same as <BS> (can be remapped in normal mode only)
" <C-m>: same as <Enter>
" <C-i>: same as <Tab>
" <C-j>: same as LineFeed (very few terminals still use it)
" <C-[>: same as <Esc>
" <C-@>: same as <C-Space>
" <C-\>: sends SIGQUIT by default)
" <C-?>: same as <Backspace> or <Del> (depending)
" <C-a>: Screen shortcut
" <C-b>: Tmux shortcut
" <C-c>: Interrupt current command
" <C-c>: Interrupt current command
" \ used as <leader>
" ´ (plugin escapes)


""" Prefixes
""""""""""""

nmap <silent> <Space> <Plug>vem_alt-
xmap <silent> <Space> <Plug>vem_alt-
nmap b <Plug>vem_z_prefix-
xmap b <Plug>vem_z_prefix-
nmap B <Plug>vem_g_prefix-
xmap B <Plug>vem_g_prefix-


""" Undo
""""""""

nmap <expr> q vem#layouts#dispatch(g:vem_layout, 'q')
xmap <expr> q vem#layouts#dispatch(g:vem_layout, 'q')
nmap <expr> Q vem#layouts#dispatch(g:vem_layout, 'Q')
xmap <expr> Q vem#layouts#dispatch(g:vem_layout, 'Q')


""" Scroll
""""""""""

nmap <C-e> <Plug>vem_scroll_up-
xmap <C-e> <Plug>vem_scroll_up-
nmap <C-d> <Plug>vem_scroll_down-
xmap <C-d> <Plug>vem_scroll_down-
map <Plug>vem_alt-e <Plug>vem_scroll_to_top-
map <Plug>vem_alt-d <Plug>vem_scroll_to_bottom-
map ~ <Plug>vem_scroll_to_middle-


""" Buffers
"""""""""""

map <C-a><Space> <Plug>vem_new_buffer-
map <C-a>h <Plug>vem_new_win_left-
map <C-a><C-h> <Plug>vem_new_win_left-
map <C-a>j <Plug>vem_new_win_down-
map <C-a><C-j> <Plug>vem_new_win_down-
map <C-a>_ <Plug>vem_new_win_down-
map <C-a>k <Plug>vem_new_win_up-
map <C-a><C-k> <Plug>vem_new_win_up-
map <C-a>l <Plug>vem_new_win_right-
map <C-a><C-l> <Plug>vem_new_win_right-
map <C-a>v <Plug>vem_new_win_right-
map <C-a><C-v> <Plug>vem_new_win_right-
map <C-a>t <Plug>vem_new_tab_and_buffer-
map <C-a><C-t> <Plug>vem_new_tab_and_buffer-

nmap <expr> w vem#layouts#dispatch(g:vem_layout, 'w')
xmap <expr> w vem#layouts#dispatch(g:vem_layout, 'w')
nmap <expr> W vem#layouts#dispatch(g:vem_layout, 'W')
xmap <expr> W vem#layouts#dispatch(g:vem_layout, 'W')
map <expr> <Plug>vem_alt-w vem#layouts#dispatch(g:vem_layout, "\<Plug>vem_alt-w")
map <Plug>vem_alt-_ <Plug>vem_open_file_under_cursor-

map <C-t> <Plug>vem_switch_buffer-
nmap t <Plug>vem_goto_next_buffer-
xmap t <Plug>vem_goto_next_buffer-
nmap T <Plug>vem_goto_prev_buffer-
xmap T <Plug>vem_goto_prev_buffer-
nmap { <Plug>vem_shift_buffer_left-
xmap { <Plug>vem_shift_buffer_left-
nmap } <Plug>vem_shift_buffer_right-
xmap } <Plug>vem_shift_buffer_right-

nmap <Plug>vem_alt-t <Plug>vem_alternate_buffer-
xmap <Plug>vem_alt-t <Plug>vem_alternate_buffer-

nmap s <Plug>vem_save-
xmap s <Plug>vem_save-

nmap x <Plug>vem_smart_close-
xmap x <Plug>vem_smart_close-
nmap <C-x> <Plug>vem_close_keep_window-
xmap <C-x> <Plug>vem_close_keep_window-
map <Plug>vem_alt-x <Plug>vem_exit-


""" Windows
"""""""""""

nmap <Plug>vem_alt-j <Plug>vem_win_down-
nmap <Plug>vem_alt-k <Plug>vem_win_up-
nmap <Plug>vem_alt-l <Plug>vem_win_right-
nmap <Plug>vem_alt-h <Plug>vem_win_left-

map <C-w> <Plug>vem_win-
map <Plug>vem_win-<Esc> <Plug>vem_nop-

map <C-w><C-w> <Plug>vem_last_accessed_window-

map <Plug>vem_win-u <Plug>vem_clone_win_up-
map <Plug>vem_win-k <Plug>vem_clone_win_left-
map <Plug>vem_win-j <Plug>vem_clone_win_down-
map <Plug>vem_win-l <Plug>vem_clone_win_right-

map <Plug>vem_win-<Space> <Plug>vem_only_window-

map <Plug>vem_win-+ <Plug>vem_increase_win_height-
map <Plug>vem_win-- <Plug>vem_decrease_win_height-
map <Plug>vem_win-> <Plug>vem_increase_win_width-
map <Plug>vem_win-< <Plug>vem_decrease_win_width-

map <Plug>vem_win-r <Plug>vem_rotate_window_up-
map <Plug>vem_win-R <Plug>vem_rotate_window_down-

map <Plug>vem_win-a <Plug>vem_move_win_top-
map <Plug>vem_win-z <Plug>vem_move_win_bottom-
map <Plug>vem_win-, <Plug>vem_move_win_left-
map <Plug>vem_win-. <Plug>vem_move_win_right-


""" Macros
""""""""""

nmap @x <Plug>vem_record_macro_x-
xmap @x <Plug>vem_record_macro_x-
nmap @s <Plug>vem_record_macro_s-
xmap @s <Plug>vem_record_macro_s-
nmap @X <Plug>vem_append_macro_x-
xmap @X <Plug>vem_append_macro_x-
nmap @S <Plug>vem_append_macro_s-
xmap @S <Plug>vem_append_macro_s-

nmap @@ <Plug>vem_stop_recording-
xmap @@ <Plug>vem_stop_recording-

nmap S <Plug>vem_play_macro_s-
xmap S <Plug>vem_play_macro_s-
nmap X <Plug>vem_play_macro_x-
xmap X <Plug>vem_play_macro_x-


""" Clipboard
"""""""""""""

nmap e <Plug>vem_copy-
xmap e <Plug>vem_copy-
nmap E <Plug>vem_copy_aux-
xmap E <Plug>vem_copy_aux-
nmap d <Plug>vem_cut-
xmap d <Plug>vem_cut-
nmap D <Plug>vem_cut_aux-
xmap D <Plug>vem_cut_aux-


""" Replace
"""""""""""

nmap r <Plug>vem_replace_char-
xmap r <Plug>vem_replace_char-
map <Plug>vem_alt-r <Plug>vem_replace_mode-


""" Delete and change
"""""""""""""""""""""

nmap c <Plug>vem_delete_line-
xmap c <Plug>vem_delete-

nmap <DEL> <Plug>vem_delete-
xmap <DEL> <Plug>vem_delete-

nmap f <Plug>vem_change_word-
nmap F <Plug>vem_change_eol-
nmap <C-f> <Plug>vem_change_surrounded_text-

xmap f <Plug>vem_change-
xmap F <Plug>vem_change-
xmap <C-f> <Plug>vem_change-

nmap I <Plug>vem_backspace-
xmap I <Plug>vem_backspace-
nmap O <Plug>vem_delete-
xmap O <Plug>vem_delete-


""" Select
""""""""""

nmap g <Plug>vem_inner_select_word-
xmap g <Plug>vem_inner_reselect_non_whitespace-
nmap G <Plug>vem_start_char_selection-
xmap G <Plug>vem_change_selection_mode-

xmap i <Plug>vem_change_selection_mode-
xmap o <Plug>vem_toggle_selection_end-

map <C-g> <Plug>vem_increase_selection-

xmap <Space> <Plug>vem_deselect-
xmap <S-Space> <Plug>vem_deselect-
nmap <Space>g <Plug>vem_reselect-
nmap <Space>G <Plug>vem_reselect-
nmap <Plug>vem_alt-<Space> <Plug>vem_select_last_pasted_text-
nmap <Space>a <Plug>vem_select_all-

xmap H <Plug>vem_increase_word_selection_left-
xmap L <Plug>vem_increase_word_selection_right-
vmap <S-Left> <Plug>vem_increase_word_selection_left-
vmap <S-Right> <Plug>vem_increase_word_selection_right-


""" Select objects
""""""""""""""""""

xmap ia <Plug>vem_select_all-
xmap oa <Plug>vem_select_all-

xmap iw <Plug>vem_inner_select_word-
xmap ow <Plug>vem_outer_select_word-

xmap in <Plug>vem_inner_select_non_whitespace-
xmap on <Plug>vem_outer_select_non_whitespace-

xmap il <Plug>vem_inner_select_line-
xmap ol <Plug>vem_outer_select_line-

xmap is <Plug>vem_inner_select_sentence-
xmap os <Plug>vem_outer_select_sentence-

xmap ip <Plug>vem_inner_select_paragraph-
xmap op <Plug>vem_outer_select_paragraph-

xmap ib <Plug>vem_inner_select_block-
xmap ob <Plug>vem_outer_select_block-

xmap iB <Plug>vem_inner_select_full_block-
xmap oB <Plug>vem_outer_select_full_block-

xmap i( <Plug>vem_inner_select_parens-
xmap o( <Plug>vem_outer_select_parens-
xmap i) <Plug>vem_inner_select_parens-
xmap o) <Plug>vem_outer_select_parens-

xmap i{ <Plug>vem_inner_select_braces-
xmap o{ <Plug>vem_outer_select_braces-
xmap i} <Plug>vem_inner_select_braces-
xmap o} <Plug>vem_outer_select_braces-

xmap i[ <Plug>vem_inner_select_brackets-
xmap o[ <Plug>vem_outer_select_brackets-
xmap i] <Plug>vem_inner_select_brackets-
xmap o] <Plug>vem_outer_select_brackets-

xmap i< <Plug>vem_inner_select_angle_brackets-
xmap o< <Plug>vem_outer_select_angle_brackets-
xmap i> <Plug>vem_inner_select_angle_brackets-
xmap o> <Plug>vem_outer_select_angle_brackets-

xmap it <Plug>vem_inner_select_tags-
xmap ot <Plug>vem_outer_select_tags-

xmap i' <Plug>vem_inner_select_single_quotes-
xmap o' <Plug>vem_outer_select_single_quotes-

xmap i" <Plug>vem_inner_select_double_quotes-
xmap o" <Plug>vem_outer_select_double_quotes-

xmap i` <Plug>vem_inner_select_backsticks-
xmap o` <Plug>vem_outer_select_backsticks-


""" Comment
"""""""""""

nmap v <Plug>vem_toggle_comment-
xmap v <Plug>vem_toggle_comment-
nmap V <Plug>vem_block_comment-
xmap V <Plug>vem_block_comment-


""" Marks
"""""""""

nmap ! <Plug>vem_set_mark-
xmap ! <Plug>vem_set_mark-
nmap ` <Plug>vem_goto_mark-
xmap ` <Plug>vem_goto_mark-
nmap ' <Plug>vem_goto_mark_line-
xmap ' <Plug>vem_goto_mark_line-


""" Misc
""""""""

map <C-r> <Plug>vem_redraw-


""" Quickfix
""""""""""""

nmap <expr> Y vem#layouts#dispatch(g:vem_layout, 'Y')
xmap <expr> Y vem#layouts#dispatch(g:vem_layout, 'Y')
nmap N <Plug>vem_quickfix_next_result-
xmap N <Plug>vem_quickfix_next_result-
nmap <C-y> <Plug>vem_location_prev_result-
nmap <C-y> <Plug>vem_location_prev_result-
nmap <C-n> <Plug>vem_location_next_result-
xmap <C-n> <Plug>vem_location_next_result-


""" Spelling
""""""""""""

nmap <Plug>vem_alt-y <Plug>vem_prev_spell-
xmap <Plug>vem_alt-y <Plug>vem_prev_spell-
nmap <Plug>vem_alt-n <Plug>vem_next_spell-
xmap <Plug>vem_alt-n <Plug>vem_next_spell-

map <Plug>vem_alt-? <Plug>vem_suggest_spell-

map <Plug>vem_alt-+ <Plug>vem_add_spell-
map <Plug>vem_alt-- <Plug>vem_remove_spell-


""" Search
""""""""""

nmap / <Plug>vem_search_forward-
xmap / <Plug>vem_search_forward-
nmap - <Plug>vem_search_forward-
xmap - <Plug>vem_search_forward-
nmap ? <Plug>vem_search_backward-
xmap ? <Plug>vem_search_backward-

nmap u <Plug>vem_search_prev-
xmap u <Plug>vem_search_prev-
nmap m <Plug>vem_search_next-
xmap m <Plug>vem_search_next-

nmap _ <Plug>vem_search_word_under_cursor-
xmap _ <Plug>vem_search_word_under_cursor-
nmap <C-_> <Plug>vem_search_word_under_cursor_backwards-
xmap <C-_> <Plug>vem_search_word_under_cursor_backwards-

nmap <Plug>vem_alt-, <Plug>vem_search_char_backward-
xmap <Plug>vem_alt-, <Plug>vem_search_char_backward-
nmap <Plug>vem_alt-. <Plug>vem_search_char_forward-
xmap <Plug>vem_alt-. <Plug>vem_search_char_forward-
nmap <C-v> <Plug>vem_repeat_search_char-
xmap <C-v> <Plug>vem_repeat_search_char-


""" Move
""""""""

nmap <expr> a vem#layouts#dispatch(g:vem_layout, 'a')
xmap <expr> a vem#layouts#dispatch(g:vem_layout, 'a')
nmap <expr> z vem#layouts#dispatch(g:vem_layout, 'z')
xmap <expr> z vem#layouts#dispatch(g:vem_layout, 'z')
map <expr> <Plug>vem_alt-z vem#layouts#dispatch(g:vem_layout, "\<Plug>vem_alt-z")

nmap 0 <Plug>vem_goto_first_column-
xmap 0 <Plug>vem_goto_first_column-
nmap ^ <Plug>vem_goto_bol-
xmap ^ <Plug>vem_goto_bol-
nmap $ <Plug>vem_goto_eol-
xmap $ <Plug>vem_goto_eol-

nmap % <Plug>vem_goto_matching_pair-
xmap % <Plug>vem_goto_matching_pair-

nmap <Plug>vem_alt-p <Plug>vem_changed_text_end-

nmap R <Plug>vem_jump_history_back-
xmap R <Plug>vem_jump_history_back-
nmap <Plug>vem_alt-r <Plug>vem_jump_history_forward-
xmap <Plug>vem_alt-r <Plug>vem_jump_history_forward-

nmap U <Plug>vem_page_up-
xmap U <Plug>vem_page_up-
nmap M <Plug>vem_page_down-
xmap M <Plug>vem_page_down-

map <PageUp> <Plug>vem_page_up-
map <PageDown> <Plug>vem_page_down-

nmap h <Plug>vem_left-
xmap h <Plug>vem_left-
nmap l <Plug>vem_right-
xmap l <Plug>vem_right-
nmap j <Plug>vem_down-
xmap j <Plug>vem_down-
nmap k <Plug>vem_up-
xmap k <Plug>vem_up-

map  <Left> <Plug>vem_left-
map  <Right> <Plug>vem_right-
map  <Up> <Plug>vem_up-
map  <Down> <Plug>vem_down-

nmap H <Plug>vem_word_left-
nmap L <Plug>vem_word_right-
nmap J <Plug>vem_paragraph_down-
xmap J <Plug>vem_paragraph_down-
nmap K <Plug>vem_paragraph_up-
xmap K <Plug>vem_paragraph_up-

map  <S-Down> <Plug>vem_paragraph_down-
map  <S-Up> <Plug>vem_paragraph_up-

nmap <Plug>vem_alt-u <Plug>vem_goto_win_top-
xmap <Plug>vem_alt-u <Plug>vem_goto_win_top-
nmap <Plug>vem_alt-- <Plug>vem_goto_win_middle-
xmap <Plug>vem_alt-- <Plug>vem_goto_win_middle-
nmap <Plug>vem_alt-m <Plug>vem_goto_win_bottom-
xmap <Plug>vem_alt-m <Plug>vem_goto_win_bottom-

nmap <expr> ; vem#layouts#dispatch(g:vem_layout, ';')
xmap <expr> ; vem#layouts#dispatch(g:vem_layout, ';')

nmap <Plug>vem_alt-; <Plug>vem_goto_eonw-
xmap <Plug>vem_alt-; <Plug>vem_goto_eonw-

nmap , <Plug>vem_goto_bol-
xmap , <Plug>vem_goto_bol-

nmap <expr> . vem#layouts#dispatch(g:vem_layout, '.')
xmap <expr> . vem#layouts#dispatch(g:vem_layout, '.')


""" Modes
"""""""""

nmap i <Plug>vem_insert_left-
nmap o <Plug>vem_insert_right-

nmap <Insert> <Plug>vem_replace_mode-

map <C-h> <Plug>vem_insert_start-
map <C-l> <Plug>vem_insert_end-
map <C-Left> <Plug>vem_insert_start-
map <C-Right> <Plug>vem_insert_end-

nmap <C-j> <Plug>vem_insert_below-
nmap <C-k> <Plug>vem_insert_above-
nmap <C-Down> <Plug>vem_insert_below-
nmap <C-Up> <Plug>vem_insert_above-

map <C-o> <Plug>vem_normal_mode-
imap <C-o> <Plug>vem_normal_mode-
cmap <C-o> <Plug>vem_exit_command_line-


""" Tags
""""""""

nmap <Plug>vem_alt-i <Plug>vem_go_back-
xmap <Plug>vem_alt-i <Plug>vem_go_back-
nmap <Plug>vem_alt-o <Plug>vem_follow_tag-
xmap <Plug>vem_alt-o <Plug>vem_follow_tag-


""" Paste
"""""""""

nmap p <Plug>vem_paste_after-
xmap p <Plug>vem_paste_after-
nmap P <Plug>vem_paste_after_aux-
xmap P <Plug>vem_paste_after_aux-

nmap <C-p>h <Plug>vem_paste_bol-
nmap <C-p>H <Plug>vem_paste_bol_aux-

nmap <C-p>j <Plug>vem_paste_below-
nmap <C-p>J <Plug>vem_paste_below_aux-
nmap <C-p><C-p>j <Plug>vem_paste_indenting_below-
nmap <C-p><C-p>J <Plug>vem_paste_indenting_below_aux-

nmap <C-p>k <Plug>vem_paste_above-
nmap <C-p>K <Plug>vem_paste_above_aux-
nmap <C-p><C-p>k <Plug>vem_paste_indenting_above-
nmap <C-p><Space> <Plug>vem_paste_indenting_above-
nmap <C-p><C-p>K <Plug>vem_paste_indenting_above_aux-

nmap <C-p>l <Plug>vem_paste_eol-
nmap <C-p>L <Plug>vem_paste_eol_aux-

cmap <C-p> <Plug>vem_paste_cmd-

nmap <C-p><Esc> <Plug>vem_nop-


""" Surround
""""""""""""

xmap s <Plug>vem_surround-
nmap <Plug>vem_alt-c <Plug>vem_change_surround-
nmap <Plug>vem_alt-f <Plug>vem_delete_surround-

nmap <Plug>vem_alt-{ <Plug>vem_change_{-
nmap <Plug>vem_alt-} <Plug>vem_change_}-
nmap <Plug>vem_alt-[ <Plug>vem_change_[-
nmap <Plug>vem_alt-] <Plug>vem_change_]-
nmap <Plug>vem_alt-( <Plug>vem_change_(-
nmap <Plug>vem_alt-) <Plug>vem_change_)-
nmap <Plug>vem_alt-< <Plug>vem_change_<-
nmap <Plug>vem_alt-> <Plug>vem_change_>-
nmap <Plug>vem_alt-` <Plug>vem_change_`-
nmap <Plug>vem_alt-' <Plug>vem_change_'-
nmap <Plug>vem_alt-" <Plug>vem_change_"-


""" Format
""""""""""

nmap \| <Plug>vem_format_text-
xmap \| <Plug>vem_format_text-

nmap = <Plug>vem_format_code-
xmap = <Plug>vem_format_code-

nmap & <Plug>vem_join_lines-
xmap & <Plug>vem_join_lines-

nmap <BS> <Plug>vem_unindent-
xmap <BS> <Plug>vem_unindent-
nmap <S-Tab> <Plug>vem_unindent-
xmap <S-Tab> <Plug>vem_unindent-

nmap <Tab> <Plug>vem_indent-
xmap <Tab> <Plug>vem_indent-

nmap <expr> y vem#layouts#dispatch(g:vem_layout, 'y')
xmap <expr> y vem#layouts#dispatch(g:vem_layout, 'y')
nmap n <Plug>vem_add_line_below-

nmap <Enter> <Plug>vem_enter-
vmap <Enter> <Plug>vem_nop-

map <C-u> <Plug>vem_toggle_case-

nmap <expr> A vem#layouts#dispatch(g:vem_layout, 'A')
xmap <expr> A vem#layouts#dispatch(g:vem_layout, 'A')
nmap <expr> Z vem#layouts#dispatch(g:vem_layout, 'Z')
xmap <expr> Z vem#layouts#dispatch(g:vem_layout, 'Z')

""" Tabpages
""""""""""""

nmap + <Plug>vem_new_tab-

nmap 1 <Plug>vem_goto_tab_1-
xmap 1 <Plug>vem_goto_tab_1-
nmap 2 <Plug>vem_goto_tab_2-
xmap 2 <Plug>vem_goto_tab_2-
nmap 3 <Plug>vem_goto_tab_3-
xmap 3 <Plug>vem_goto_tab_3-
nmap 4 <Plug>vem_goto_tab_4-
xmap 4 <Plug>vem_goto_tab_4-
nmap 5 <Plug>vem_goto_tab_5-
xmap 5 <Plug>vem_goto_tab_5-
nmap 6 <Plug>vem_goto_tab_6-
xmap 6 <Plug>vem_goto_tab_6-
nmap 7 <Plug>vem_goto_tab_7-
xmap 7 <Plug>vem_goto_tab_7-
nmap 8 <Plug>vem_goto_tab_8-
xmap 8 <Plug>vem_goto_tab_8-
nmap 9 <Plug>vem_goto_tab_9-
xmap 9 <Plug>vem_goto_tab_9-

nmap ( <Plug>vem_add_space_left-
xmap ( <Plug>vem_add_space_left-
nmap ) <Plug>vem_add_space_right-
xmap ) <Plug>vem_add_space_right-


""" Insert and command line mode
""""""""""""""""""""""""""""""""

map! <C-h> <Plug>vem_left-
map! <C-j> <Plug>vem_down-
map! <C-k> <Plug>vem_up-
map! <C-l> <Plug>vem_right-

imap <Up> <Plug>vem_up-
imap <Down> <Plug>vem_down-
imap <Left> <Plug>vem_left-
imap <Right> <Plug>vem_right-

imap <C-y> <Plug>vem_clone_char_above-
imap <C-e> <Plug>vem_clone_char_below-

map! <C-z> <Plug>vem_insert_digraph-
imap <C-c> <Plug>vem_exec_normal_command-

imap <C-p> <Plug>vem_autocomplete_prev-
imap <C-n> <Plug>vem_autocomplete_next-
imap <S-Tab> <Plug>vem_autocomplete_prev-
imap <C-Tab> <Plug>vem_autocomplete_next-

map! <S-Space> <Plug>vem_space-
map! <C-Space> <Plug>vem_space-

" setting paste mode disables all key mappings
" this is necessary so it can be toggled with the given key map
inoremap <silent> <C-^> <C-o>:set paste!<CR>
set pastetoggle=<C-^>

cmap <C-Tab> <Plug>vem_wildmenu_next-
cmap <S-Tab> <Plug>vem_wildmenu_prev-


""" Unused
""""""""""

" symbols
nmap " <Plug>vem_nop-
xmap " <Plug>vem_nop-
nmap # <Plug>vem_nop-
xmap # <Plug>vem_nop-
nmap * <Plug>vem_nop-
xmap * <Plug>vem_nop-
nmap < <Plug>vem_nop-
xmap < <Plug>vem_nop-
nmap > <Plug>vem_nop-
xmap > <Plug>vem_nop-

" uppercase letters
nmap C <Plug>vem_nop-
xmap C <Plug>vem_nop-

