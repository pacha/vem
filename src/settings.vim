" Vem: default settings

""" Buffers
"""""""""""

" allow hidden buffers
set hidden

" read file again if modified in disk and there are not unsaved changes
set autoread

""" Windows
"""""""""""

" create new windows at the right and bottom of the screen
set splitright
set splitbelow


""" Cursor Movement
"""""""""""""""""""

" allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" go to previous/following line when surpassing
" the boundaries of the current line
set whichwrap+=<,>,[,],h,l

" don't change column on cursor jumps
set nostartofline


""" Indent
""""""""""

" copy last line indent
set autoindent

" use spaces instead of tabs
set expandtab

" hard tabstop size
set tabstop=8

" soft tabstop size
set softtabstop=4

" indentation size
set shiftwidth=4

" insert space according to shiftwidth not (soft)tabstop
set smarttab


""" Search
""""""""""

" search as you type
set incsearch

" search wrapping around the document
set wrapscan

" highlight searched term
set hlsearch


""" Mappings
""""""""""""

" clear keybindings
mapclear

" don't use timeouts in key mappings but use them in key codes
set notimeout
set ttimeout
set ttimeoutlen=100

" matching pairs to jump to
set matchpairs=(:),{:},[:],<:>

" prevent the langmap option from affecting user mappings
if has('langmap') && exists('+langremap')
  set nolangremap
endif

" choose clipboard depending on platform
if has('clipboard')
    if has("win16") || has("win32") || has("win64")
        "use Windows clipboard
        let g:vem_main_clipboard = '*'
    else
        "use X and Mac primary selection
        let g:vem_main_clipboard = '+'
    endif
else
    "don't use system clipboard
    let g:vem_main_clipboard = '"'
endif
let g:vem_aux_clipboard = 'x'


""" Command Line
""""""""""""""""

" improve command completion
set wildmenu

" use tab to start command completion
set wildchar=<Tab>

" increase default command line history size
set history=500

" show more info in command line
set showcmd


""" Visual Mode
"""""""""""""""

" use virtual editing for block selection
" (allows to select beyond line endings)
set virtualedit=block


""" Scroll
""""""""""

" scroll when cursor reaches bottom/top of window
set scrolloff=0

" when wrapping is not active, scroll char by char horizontally
set sidescroll=1

" when wrapping is not active, scroll when the cursor reaches the window
" boundary
set sidescrolloff=0


""" Completion
""""""""""""""

" don't use include files
set complete-=i

""" Formatting
""""""""""""""

set nojoinspaces

""" Encoding
""""""""""""

" always use utf-8 internally
set encoding=utf-8

""" Filetypes
"""""""""""""

" set custom options according to filetype
filetype plugin on

" but disable smart indenting according to it
filetype indent off

" also disable key mappings in filetype plugins
let g:no_plugin_maps = 1

" set filetypes for own vem's files
augroup vemStartup
    au!
    autocmd BufNewFile,BufRead vemrc set filetype=vim
augroup END


""" Files and directories
"""""""""""""""""""""""""

let &undodir = g:vem_cache_dir . 'undo//,' . &undodir
let &directory = g:vem_cache_dir . 'swap//,' . &directory
let &backupdir = g:vem_cache_dir . 'backup//,' . &backupdir
let &viewdir = g:vem_cache_dir . 'views//'

" don't interfere with Vim's viminfo file
" (don't create one unless we can create one separate from the official file)
if isdirectory(g:vem_cache_dir)
    try
        let &viminfofile = g:vem_cache_dir . 'veminfo'
    catch /E355:/
        set viminfo=
    endtry
else
    set viminfo=
endif

""" Mouse
"""""""""

set mouse=a


""" UI
""""""

" set vem color scheme
colorscheme vem-dark

" use syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" use custom window/terminal title
set title

" text of the custom title
set titlestring=%t%(\ %M%)%(\ %r%)%(\ (%{expand(\"%:p:~:h\")})%)%(\ %h%)%(\ %a%)%(\ \-\ %)Vem

" text to show when exiting Vem 
set titleold=

" show line numbers
set number

" always show the status line
set laststatus=2

" don't use pipes to fill window separators
set fillchars=vert:\ ,fold:-

"show partial lines (no @ signs on last line)
set display=lastline

" don't show mode in last line of the screen (ie. '-- INSERT --')
set noshowmode

" don't show extra information in the last line of the screen
" (it shows the partial Vim commands instead of the partial Vem ones,
" which can be misleading).
set noshowcmd

" don't show startup screen
set shortmess+=I

" don't use '(3 of 5)' instead of '(file 3 of 5)'
set shortmess-=f

" don't use '[noeol]' instead of '[Incomplete last line]'
set shortmess-=i

" don't use '999L, 888C' instead of '999 lines, 888 characters'
set shortmess-=l

" don't use '[+]' instead of '[Modified]'
set shortmess-=m

" don't use '[New]' instead of '[New File]'
set shortmess-=n

" don't use '[RO]' instead of '[readonly]'
set shortmess-=r

" don't use '[w]' instead of 'written' nor '[a]' instead of 'appended'
set shortmess-=w

" use '[dos format]' for '[dos]', '[unix format]' for '[unix]' and '[mac format]' for '[mac]'
set shortmess-=x

" show 'search hit BOTTOM, continuing at TOP' message
set shortmess-=s

" don't give the ATTENTION message for swap files
set shortmess+=A

