" Vem: set runtime directories

" add Vem directory to runtime
" (this is the first step so vim-pathogen is available for the next steps)
let &runtimepath = &runtimepath . ',' . g:vem_dir . 'runtime/'

" remove directories from a string with a comma separated list of them
function! s:removeFromPath(path, pattern)
    let current_path = pathogen#split(a:path)
    let new_path = []
    for directory in current_path
        if directory !~# a:pattern
            let new_path += [directory]
        endif
    endfor
    return pathogen#join(new_path)
endfunction

" remove Vim/Neovim user directories from the runtime and package paths
if empty($HOME)
    let s:dirs_to_remove = '^\~.\+\(vim\|nvim\)'
else
    let s:dirs_to_remove = '^\(' . escape($HOME, '\/') . '\/\|\~\).\+\(vim\|nvim\)'
endif
let &runtimepath = <SID>removeFromPath(&runtimepath, s:dirs_to_remove)
if has('packages')
    let &packpath = <SID>removeFromPath(&packpath, s:dirs_to_remove)
endif

" set internal Vem plugin directory
let s:vem_plugin_dir = g:vem_dir . 'plugins/'

" set plugin directories (with support for Vim 8 packages structure for Vim 7 too)
exec pathogen#infect(s:vem_plugin_dir . '{}', g:vem_user_dir . 'pack/{}/start/{}')

" user configuration directory
let &runtimepath = g:vem_user_dir . ',' . &runtimepath . ',' . g:vem_user_dir . 'after/'
if has('packages')
    let &packpath = g:vem_user_dir . ',' . &packpath
endif

