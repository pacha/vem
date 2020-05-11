" Vem: default settings for the graphical interface

if has('gui_running')

    " don't load menus
    let did_install_default_menus = 1
    let did_install_syntax_menu = 1
    set guioptions+=M

    " drop toolbar
    set guioptions-=T

    " drop menu bar
    set guioptions-=m

    " don't include tearoff options in menus
    set guioptions-=t

    " drop scrollbars
    set guioptions-=l
    set guioptions-=L
    set guioptions-=R

    " but add vertical scrollbar
    set guioptions+=r

    " don't enable keys to access menus
    set winaltkeys=no

    " disable autoselections
    set guioptions-=a
    set guioptions-=A
    set guioptions-=P

    " don't show dialog windows but use the statusline
    set guioptions+=c

endif

