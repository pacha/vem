" Vem: custom configuration

""" System Configuration
""""""""""""""""""""""""

let g:vem_system_dir = '/etc/vem/'
let s:vem_system_rc = g:vem_system_dir . 'vemrc'
if filereadable(s:vem_system_rc)
    exec 'source ' . s:vem_system_rc
endif


""" User Configuration
""""""""""""""""""""""

let s:vem_user_rc = g:vem_user_dir . 'vemrc'
if filereadable(s:vem_user_rc)
    exec 'source ' . s:vem_user_rc
endif

