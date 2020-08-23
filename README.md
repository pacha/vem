
Vem
===

Vem is an alternative command layout for the Vim text editor. It provides full
keyboard control over the editor while trying to be as simple and intuitive as
possible.

![Vem Text Editor](doc/img/vem-main-screenshot.png)

Vem is a set of configuration files for the Vim text editor that changes how you
interact with it. While Vim is extremely expressive and provides hundreds of
commands with their own small grammar, Vem takes the opposite approach and
defines a reduced, simplified set of commands that are executed, in most cases,
immediately after a single key press. The commands are also distributed
spatially across the keyboard, like in a map, optimizing their position
according to their frequency.

The result is a different editor, strongly focused on the user experience, that
strives to be as simple as possible while still giving you total control using
just the keyboard. Since it uses actual Vim as base, you can also make use of
its many advanced features.

Vem requires either Vim or Neovim to be installed in the system and supports the
`QWERTY`, `QWERTZ` and `AZERTY` keyboard layouts.

You can find more information about Vem here:

* [Main site](https://www.vem-editor.org)
* [Tutorial](https://www.vem-editor.org/docs/tutorial.html)
* [User's Guide](https://www.vem-editor.org/docs/users-guide/index.html)

Installation
------------

To install Vem, just clone the source from GitHub and execute the Makefile
inside:
```
    git clone https://github.com/pacha/vem.git
    cd vem
    sudo make install
```

Now the commands:

* `vem` for using Vem with Vim
* `nvem` for using Vem with NeoVim
* `gvem` for using Vem with the graphical version of Vim

should be available in your terminal.

Related projects
----------------

Parts of Vem can be used independently of the main project and are released as
Vim/Neovim plugins:

* [Vem Tabline](https://github.com/pacha/vem-tabline): A plugin to show the
  list of buffers in the tabline.

* [Vem Statusline](https://github.com/pacha/vem-statusline): A light
  statusline for Vim.

* [Vem Dark](https://github.com/pacha/vem-dark): A dark color scheme for
  Vim based on Wombat.

Credits
-------

Vem makes use of some Vim plugins to power some of its features. Many
thanks to the authors of the following great projects:

    * [vim-pathogen](https://github.com/tpope/vim-pathogen) by Tim Pope
    * [vim-filebeagle](https://github.com/jeetsukumaran/vim-filebeagle) by Jeet Sukumaran
    * [vim-smartword](https://github.com/kana/vim-smartword) by Kana Natsuno
    * [vim-enhancedjumps](https://github.com/inkarkat/vim-EnhancedJumps) by Ingo Karkat
    * [wildfire.vim](https://github.com/gcmt/wildfire.vim) by Giacomo Comitti
    * [vim-surround](https://github.com/tpope/vim-surround) by Tim Pope
    * [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) originally by @kien, maintained by @mattn
    * [NERD Commenter](https://github.com/scrooloose/nerdcommenter) by Martin Grenfell
    * [vim-sayonara](https://github.com/mhinz/vim-sayonara) by Marco Hinz

License
-------

Vem is [open source](https://github.com/pacha/vem/) and free. Vem is released
under the [MIT license](https://github.com/pacha/vem/blob/master/LICENSE).

