
Vem Statusline
==============

Vem Statusline is a simple and fast statusline for Vim.

![VemStatusline](doc/images/vem-statusline-dark.png)

It displays:

* Current active mode

* Current Git branch (requires [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
  or [fugitive.vim](https://github.com/tpope/vim-fugitive))

* Filename (absolute, relative or relative to the root of the repository)

* Indentation type and size (`tabs`, `spaces`, `tabs+spaces`)

* File enconding (eg. `utf-8`, `latin-1`  or `cp1251`)

* Newline type (Unix: `LF`, Windows: `CRLF`, Mac pre-OSX: `CR`)

* Position in the file (line:column) and percentage progress through the file

Vem Statusline is designed to be a very fast, small plugin and oriented to
people that want a bit more information in the statusline than the one provided
by default but that don't want to install a complex plugin for that. (In fact,
you can also create your own statusline in that case! Check `:help statusline`.
It's not that difficult and you can use Vem Statusline as base if you want to
do so).

If you prefer a plugin with more configuration options and that allows you to
define a great deal of elements and their positions, you can check the
following ones that are very popular:

* [lightline.vim](https://github.com/itchyny/lightline.vim): It allows you to
  define your own components and to completely configure the statusline.

* [airline.vim](https://github.com/vim-airline/vim-airline): Large,
  full-fledged statusline plugin with lots of options and that integrates with
  many other popular plugins.

In any case, Vem Statusline does provide some configuration options: you can
enable/disable any element in the statusline and you can also define custom
colors (see the *Colors* and *Configuration* sections).

*Note*: Vem Statusline is a component of a bigger Vim configuration setup named
[Vem](https://www.vem-editor.org/). Hence the plugin name. In any case, Vem
Statusline can be used totally independently from the Vem project. Other
components of the project are:

* [Vem Tabline](https://github.com/pacha/vem-tabline): A plugin to show the
  list of buffers in the tabline.
* [Vem Dark](https://github.com/pacha/vem-dark): A dark color scheme for
  Vim based on Wombat.

Installation
------------

You can use Vem Statusline straight away after installation. However, by
default Vim only shows the statusline if there are at least two windows. So if
you always want to have the statusline displayed, add this to your `.vimrc`
file:
```
set laststatus=2
```
Also, since the mode can be shown now in the statusline, you may also avoid
displaying the mode messages like:
```
-- INSERT --
```
at the bottom of the screen by also setting:
```
set noshowmode
```

Colors
------

By default, Vem Statusline uses the standard `StatusLine` and `StatusLineNC`
highlighting groups, which means that the statusline colors will automatically
adapt to your currently active color scheme.

However, you can also define specific colors for different parts of the
statusline:

Highlighting Group        | Default    | Color for
--------------------------|------------|-----------------------------------
VemStatusLineMode         | StatusLine | Mode indicator
VemStatusLineModeInsert   | StatusLine | Mode indicator (only insert mode)
VemStatusLineBranch       | StatusLine | Current Git Branch
VemStatusLineFileModified | StatusLine | File modified indicator (`*`) 
VemStatusLineFileRO       | StatusLine | Read-only file indicator (`[RO]`)
VemStatusLinePosition     | StatusLine | Position indicator (`line:col`)
VemStatusLineSeparator    | StatusLine | Symbols to separate elements (`|`)

For example, for a dark themed statusline, you can add this to your
configuration:

![DarkStatusline](doc/images/vem-statusline-dark.png)

```
highlight StatusLine                cterm=none ctermfg=255 ctermbg=237 guifg=#e6e3d8 guibg=#373737 gui=none
highlight StatusLineNC              cterm=none ctermfg=243 ctermbg=238 guifg=#857b6f guibg=#404040 gui=none
highlight VemStatusLineMode         cterm=bold ctermfg=192 ctermbg=237 guifg=#cae682 guibg=#373737 gui=bold
highlight VemStatusLineModeInsert   cterm=bold ctermfg=117 ctermbg=237 guifg=#8ac6f2 guibg=#373737 gui=bold
highlight VemStatusLineBranch       cterm=none ctermfg=246 ctermbg=237 guifg=#999999 guibg=#373737 gui=none
highlight VemStatusLineFileModified cterm=bold ctermfg=192 ctermbg=237 guifg=#cae682 guibg=#373737 gui=bold
highlight VemStatusLineFileRO       cterm=bold ctermfg=192 ctermbg=237 guifg=#e5786d guibg=#373737 gui=bold
highlight VemStatusLineSeparator    cterm=none ctermfg=246 ctermbg=237 guifg=#999999 guibg=#373737 gui=none
highlight VemStatusLinePosition     cterm=bold ctermfg=255 ctermbg=237 guifg=#f6f3e8 guibg=#373737 gui=bold
```

For a light themed statusline, the configuration could be something like:

![LightStatusline](doc/images/vem-statusline-light.png)

```
highlight StatusLine                cterm=none ctermfg=235 ctermbg=254 guifg=#272727 guibg=#e8e8e8 gui=none
highlight StatusLineNC              cterm=none ctermfg=246 ctermbg=251 guifg=#909090 guibg=#c8c8c8 gui=none
highlight VemStatusLineMode         cterm=bold ctermfg=30  ctermbg=254 guifg=#228080 guibg=#e8e8e8 gui=bold
highlight VemStatusLineModeInsert   cterm=bold ctermfg=166 ctermbg=254 guifg=#d75f00 guibg=#e8e8e8 gui=bold
highlight VemStatusLineBranch       cterm=none ctermfg=243 ctermbg=254 guifg=#777777 guibg=#e8e8e8 gui=none
highlight VemStatusLineFileModified cterm=bold ctermfg=30  ctermbg=254 guifg=#228080 guibg=#e8e8e8 gui=bold
highlight VemStatusLineFileRO       cterm=bold ctermfg=167 ctermbg=254 guifg=#e5786d guibg=#e8e8e8 gui=bold
highlight VemStatusLineSeparator    cterm=none ctermfg=243 ctermbg=254 guifg=#777777 guibg=#e8e8e8 gui=none
highlight VemStatusLinePosition     cterm=bold ctermfg=235 ctermbg=254 guifg=#272727 guibg=#e8e8e8 gui=bold
```

Displaying the current Git branch
---------------------------------

Vem Statusline can optionally display the current branch of the repository
you're working on. To do so you need a Git Vim plugin.

If you don't have any Git Vim plugin and just want to display the name of
the branch, install:

* [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)

This plugin by itchyny provides just the functionality to retrieve the
branch name.

You can also install (if you don't have it already installed):

* [fugitive.vim](https://github.com/tpope/vim-fugitive)

by Tim Pope, which is a larger plugin to use Git from Vim.

If you have any of these two plugins, Vem Statusline will then automatically
display the current Git branch every time you edit a file within a repository.

If you have any other control version system or a different plugin to integrate
Vim with Git, you can also provide the name of a function that Vem Statusline
should use to display the name of the branch. (See
`g:vem_statusline_branch_function` at [Configuration](#configuration) for more
details).

*Note*: If you don't see the name of the branch and you have configured the
plugin to do so, make sure that the value of the `g:vem_statusline_parts`
variable contains a letter `b` (which is the value to display the branch name
as explained in the next section).

Configuration
-------------

You can set these variables to configure Vem Statusline in your `.vimrc` file:

`g:vem_statusline_parts`: string (default: 'mbfienpP')

    The value of this option specifies which elements of the statusline
    have to be displayed. There's a letter per element and the plugin
    will only diplay those elements whose letter is in this variable.

    For instance, if g:vem_statusline_parts = 'mf' then only the
    current mode and the current filename will be displayed.

    The meaning of the letters is:

    m: current mode
    b: current branch name
    f: current filename
    i: indent type and size (tabs, spaces, tabs+spaces)
    e: file encoding
    n: newline type (Unix: LF, Windows: CRLF, Mac pre-OSX: CR)
    p: position in the file (line:column)
    P: progress in percentage through the file

`g:vem_statusline_filename_format`: string (default: 'P')

    Format in which the current filename should be displayed:

    t: only the filename without its path (tail)
    p: full path (path)
    .: path relative to the current directory
    P: relative to the root of the current project directory. For example,
       if your project is in a Git repository the name of the filename will
       be shown relative to the folder where the '.git' directory is. To
       configure how to detect the root directory of the project use the
       option g:vem_statusline_project_marker. If the file is not within
       a project, the relative path to the current directory will be used.

`g:vem_statusline_project_marker`: string (default: '.git')

    Name of a file or directory that can be used to define the root
    directory of your project. To be used with the 'P' option of
    g:vem_statusline_filename_format.

    For example, for projects in Mercurial repositories you can use .hg and for
    Bazaar, .bzr. Many projects have a setup.cfg file at the root too.

`g:vem_statusline_branch_function`: string (default: '')

    Name of the function to execute to retrieve the current Git branch name. By
    default, Vem Statusline will detect one of the following functions provided
    by the following external plugins to display the current branch name:

    gitbranch#name for [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
    fugitive#head  for [fugitive.vim](https://github.com/tpope/vim-fugitive)

    If you don't want to use any of those plugins or you use a control version
    system different from Git (such as Mercurial or Bazaar), then you can use
    this variable to specify the function that Vem Statusline should execute to
    retrieve the branch name. For example, if the function that returns the
    name of the branch is GetBranchName() you can add the following to your
    .vimrc file:

        let g:vem_statusline_branch_function = 'GetBranchName'

`g:vem_statusline_mode_separator`: string (default: ' ~ ')

    Symbol separator between the current mode and the branch/filename
    elements. Not shown if the branch and filename are not displayed.

`g:vem_statusline_branch_separator`: string (default: ':')

    Symbol separator between the current branch and the filename.
    Not shown if the filename is not displayed.

`g:vem_statusline_right_separator`: string (default: '|')

    Symbol separator between the indent, encoding and newline elements.

