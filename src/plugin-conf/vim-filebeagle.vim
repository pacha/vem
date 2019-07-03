" vim-filebeagle customization

" Disable original mappings
let g:filebeagle_suppress_keymaps = 1

" Show line numbers in the window
let g:filebeagle_show_line_numbers = 1

" Mappings for normal mode
let g:filebeagle_buffer_normal_key_maps = {
    \ 'FileBeagleBufferRefresh': '<C-r>',
    \ 'FileBeagleBufferToggleHiddenAndIgnored': '<C-h>',
    \ 'FileBeagleBufferQuit': 'x',
    \ 'FileBeagleBufferCloseWindow': '<C-x>',
    \ 'FileBeagleBufferFocusOnParent': '<C-u>',
    \ 'FileBeagleBufferFocusOnPrevious': '<BS>',
    \ 'FileBeagleBufferCreateNewFile': '',
    \ 'FileBeagleBufferVisitTarget': '<C-b>',
    \ 'FileBeagleBufferBgVisitTarget': '<C-p><CR>',
    \ 'FileBeagleBufferSplitVerticalVisitTarget': '<C-v>',
    \ 'FileBeagleBufferBgSplitVerticalVisitTarget': '<C-p><C-v>',
    \ 'FileBeagleBufferSplitVisitTarget': '<C-_>',
    \ 'FileBeagleBufferBgSplitVisitTarget': '<C-p><C-_>',
    \ 'FileBeagleBufferTabVisitTarget': '<C-t>',
    \ 'FileBeagleBufferBgTabVisitTarget': '<C-p><C-t>',
    \ 'FileBeagleGotoBufferTop': 'a',
    \ 'FileBeagleGotoEOL': '.',
    \ 'FileBeaglePageUp': 'U',
    \ 'FileBeagleScrollUp': 'A'
    \ }

" Mappings for visual mode
let g:filebeagle_buffer_visual_key_maps = {
    \ 'FileBeagleBufferVisitTarget': '<C-b>',
    \ 'FileBeagleBufferBgVisitTarget': '<C-p><CR>',
    \ 'FileBeagleBufferSplitVerticalVisitTarget': '<C-v>',
    \ 'FileBeagleBufferBgSplitVerticalVisitTarget': '<C-p><C-v>',
    \ 'FileBeagleBufferSplitVisitTarget': '<C-_>',
    \ 'FileBeagleBufferBgSplitVisitTarget': '<C-p><C-_>',
    \ 'FileBeagleBufferTabVisitTarget': '<C-t>',
    \ 'FileBeagleBufferBgTabVisitTarget': '<C-p><C-t>',
    \ 'FileBeagleGotoBufferTop': 'a',
    \ 'FileBeagleGotoEOL': '.',
    \ 'FileBeaglePageUp': 'U',
    \ 'FileBeagleScrollUp': 'A'
    \ }

" Disable keys that modify the buffer
function! s:filebeable_disable_keys()
    for key in ["q", "Q", "d", "c", "r", "f", "F", "<C-f>", "v", "y", "n",
            \ "<C-j>", "<C-k>", "<C-l>", "<C-u>", "<C-p>", "M"]
        try
            execute "nnoremap <buffer> " . key . " <NOP>"
        catch //
        endtry
    endfor
endfunction

augroup filebeagle_config
    autocmd!

    autocmd FileType filebeagle call s:filebeable_disable_keys()

    " map <C-a> manually since it needs the <nowait> modifier to not collide
    " with the global <C-a> mappings
    autocmd FileType filebeagle nmap <buffer> <nowait> <C-a> <Plug>(FileBeagleBufferCreateNewFile)
augroup END

" Re-map movement actions in the filebeagle buffer
nmap <Plug>(FileBeagleGotoBufferTop) <Plug>vem_top-
vmap <Plug>(FileBeagleGotoBufferTop) <Plug>vem_top-
nmap <Plug>(FileBeagleGotoEOL) <Plug>vem_goto_eol-
vmap <Plug>(FileBeagleGotoEOL) <Plug>vem_goto_eol-
nmap <Plug>(FileBeaglePageUp) <Plug>vem_page_up-
vmap <Plug>(FileBeaglePageUp) <Plug>vem_page_up-
nmap <Plug>(FileBeagleScrollUp) <Plug>vem_scroll_up-
vmap <Plug>(FileBeagleScrollUp) <Plug>vem_scroll_up-

