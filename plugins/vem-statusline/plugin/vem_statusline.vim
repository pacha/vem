" Vem Statusline. A lightweight statusline for Vim.
" Part of the Vem project
" Maintainer: Andrés Sopeña <asopena@ehmm.org>
" Licence: The MIT License (MIT)

" Sentinel to prevent double execution
if exists('g:loaded_vem_statusline')
    finish
endif
let g:loaded_vem_statusline = 1

scriptencoding utf-8

" Configuration variables
let g:vem_statusline_parts = get(g:, 'vem_statusline_parts', 'mbfienpP')
let g:vem_statusline_filename_format = get(g:, 'vem_statusline_filename_format', 'P')
let g:vem_statusline_project_marker = get(g:, 'vem_statusline_project_marker', '.git')
let g:vem_statusline_branch_function = get(g:, 'vem_statusline_branch_function', '')
let g:vem_statusline_mode_separator = get(g:, 'vem_statusline_mode_separator', '  ~ ')
let g:vem_statusline_branch_separator = get(g:, 'vem_statusline_branch_separator', ':')
let g:vem_statusline_right_separator = get(g:, 'vem_statusline_right_separator', '|')

" Syntax highlighting
highlight default link VemStatusLineSeparator StatusLine
highlight default link VemStatusLineMode StatusLine
highlight default link VemStatusLineModeInsert StatusLine
highlight default link VemStatusLineBranch StatusLine
highlight default link VemStatusLineFileModified StatusLine
highlight default link VemStatusLineFileRO StatusLine
highlight default link VemStatusLinePosition StatusLine

" Configure statusline
set statusline=%!vem_statusline#render()

