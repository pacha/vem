" netrw customization

" Don't load netrwPlugin
let g:loaded_netrwPlugin = 1

""" Configuration in case the plugin gets manually activated
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NetrwPlugin has introduced an incompatible 'g' keybinding with vem
" the following line deactivates it:
let g:netrw_nogx = 1
let g:netrw_home = g:vem_cache_dir

