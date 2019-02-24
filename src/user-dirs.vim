" Vem: user directories

function! s:createDir(name)
    try
        call mkdir(a:name, "p")
    catch /^Vim\%((\a\+)\)\=:E739/
    endtry
endfunction

""" user configuration directory
""""""""""""""""""""""""""""""""

if empty($XDG_CONFIG_HOME)
    let g:vem_user_dir = $HOME . '/.config/vem/'
else
    let g:vem_user_dir = $XDG_CONFIG_HOME . '/vem/'
endif
call <SID>createDir(g:vem_user_dir)
call <SID>createDir(g:vem_user_dir . 'colors/')
call <SID>createDir(g:vem_user_dir . 'spell/')

""" user cache directory
""""""""""""""""""""""""

if empty($XDG_CACHE_HOME)
    let g:vem_cache_dir = $HOME . '/.cache/vem/'
else
    let g:vem_cache_dir = $XDG_CACHE_HOME . '/vem/'
endif
call <SID>createDir(g:vem_cache_dir)
call <SID>createDir(g:vem_cache_dir . 'swap/')
call <SID>createDir(g:vem_cache_dir . 'undo/')
call <SID>createDir(g:vem_cache_dir . 'backup/')

