" EnhancedJumps.vim: Enhanced jump list navigation commands.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"   - EnhancedJumps.vim autoload script
"   - ingo/err.vim autoload script
"
" Copyright: (C) 2009-2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_EnhancedJumps') || (v:version < 700)
    finish
endif
let g:loaded_EnhancedJumps = 1

"- configuration --------------------------------------------------------------

if ! exists('g:stopFirstAndNotifyTimeoutLen')
    let g:stopFirstAndNotifyTimeoutLen = 2000
endif
if ! exists('g:EnhancedJumps_CaptureJumpMessages')
    let g:EnhancedJumps_CaptureJumpMessages = 1
endif
if ! exists('g:EnhancedJumps_UseTab')
    let g:EnhancedJumps_UseTab = 1
endif
if ! exists('g:EnhancedJumps_SwitchStrategy')
    let g:EnhancedJumps_SwitchStrategy = 'nearest'
endif


"- mappings -------------------------------------------------------------------

nnoremap <silent> <Plug>EnhancedJumpsOlder             :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Jump',   0,'')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsNewer             :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Jump',   1,'')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsLocalOlder        :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Jump',   0,'local')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsLocalNewer        :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Jump',   1,'local')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsRemoteOlder       :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Jump',   0,'remote')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsRemoteNewer       :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Jump',   1,'remote')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>

nnoremap <silent> <Plug>EnhancedJumpsSwitchOlder       :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Switch', 0,'')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsSwitchNewer       :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Switch', 1,'')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsSwitchRemoteOlder :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Switch', 0,'remote')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsSwitchRemoteNewer :<C-u>if ! EnhancedJumps#Go('EnhancedJumps#Switch', 1,'remote')<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>

nnoremap <silent> <Plug>EnhancedJumpsFarChangeOlder         :<C-u>if ! EnhancedJumps#Changes#Jump(0,0)<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsFarChangeNewer         :<C-u>if ! EnhancedJumps#Changes#Jump(1,0)<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsFarFallbackChangeOlder :<C-u>if ! EnhancedJumps#Changes#Jump(0,1)<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>
nnoremap <silent> <Plug>EnhancedJumpsFarFallbackChangeNewer :<C-u>if ! EnhancedJumps#Changes#Jump(1,1)<Bar>echoerr ingo#err#Get('EnhancedJumps')<Bar>endif<CR>

if ! hasmapto('<Plug>EnhancedJumpsOlder', 'n')
    nmap <C-o> <Plug>EnhancedJumpsOlder
endif
if ! hasmapto('<Plug>EnhancedJumpsNewer', 'n')
    nmap <C-i> <Plug>EnhancedJumpsNewer
endif
if ! hasmapto('<Plug>EnhancedJumpsLocalOlder', 'n')
    nmap g<C-o> <Plug>EnhancedJumpsLocalOlder
endif
if ! hasmapto('<Plug>EnhancedJumpsLocalNewer', 'n')
    nmap g<C-i> <Plug>EnhancedJumpsLocalNewer
endif
if ! hasmapto('<Plug>EnhancedJumpsRemoteOlder', 'n')
    nmap <Leader><C-o> <Plug>EnhancedJumpsRemoteOlder
endif
if ! hasmapto('<Plug>EnhancedJumpsRemoteNewer', 'n')
    nmap <Leader><C-i> <Plug>EnhancedJumpsRemoteNewer
endif

if ! hasmapto('<Plug>EnhancedJumpsSwitchRemoteOlder', 'n')
    nmap <Leader><C-w><C-o> <Plug>EnhancedJumpsSwitchRemoteOlder
endif
if ! hasmapto('<Plug>EnhancedJumpsSwitchRemoteNewer', 'n')
    nmap <Leader><C-w><C-i> <Plug>EnhancedJumpsSwitchRemoteNewer
endif

if ! hasmapto('<Plug>EnhancedJumpsFarFallbackChangeOlder', 'n')
    nmap g; <Plug>EnhancedJumpsFarFallbackChangeOlder
endif
if ! hasmapto('<Plug>EnhancedJumpsFarFallbackChangeNewer', 'n')
    nmap g, <Plug>EnhancedJumpsFarFallbackChangeNewer
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
