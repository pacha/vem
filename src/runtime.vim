" Vem: set runtime directories

" add Vem directory to runtime
let &runtimepath = &runtimepath . ',' . g:vem_dir . 'runtime/'

" remove Vim directories from the runtime path
let s:current_runtimepath = pathogen#split(&runtimepath)
let s:new_runtimepath = []
for directory in s:current_runtimepath
    if directory !~# '\.vim'
        let s:new_runtimepath += [directory]
    endif
endfor
let &runtimepath = pathogen#join(s:new_runtimepath)

" set Vem plugin directory
let s:vem_plugin_dir = g:vem_dir . 'plugins/'
exec pathogen#infect(s:vem_plugin_dir . '{}')

" append user directory at the beginning of the runtimepath
let &runtimepath = g:vem_user_dir . ',' . &runtimepath

