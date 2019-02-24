" Common.vim: Shared functionality for dealing with jump lists.
"
" DEPENDENCIES:
"
" Copyright: (C) 2012-2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
let s:save_cpo = &cpo
set cpo&vim

function! EnhancedJumps#Common#GetJumps( command )
    redir => l:jumpsOutput
    silent! execute a:command
    redir END
    redraw  " This is necessary because of the :redir done earlier.

    return split(l:jumpsOutput, "\n")[1:] " The first line contains the header.
endfunction
function! s:GetCurrentIndex( jumps )
    let l:currentIndex = -1
    " Note: The linear search starts from the end because it's more likely that
    " the user hasn't navigated to the oldest entries in the jump list.
    for l:i in reverse(range(len(a:jumps)))
	if a:jumps[l:i][0] ==# '>'
	    let l:currentIndex = l:i
	    break
	endif
    endfor
    if l:currentIndex < 0
	" XXX: Sometimes, the :changes command just outputs the "change line col
	" text" line, without a ">" line following.
	throw 'EnhancedJumps: jump list does not contain > marker'
    endif
    return l:currentIndex
endfunction
function! EnhancedJumps#Common#SliceJumpsInDirection( jumps, isNewer )
"******************************************************************************
"* PURPOSE:
"   From the list of jumps, keep only those following the current index in the
"   direction of jump, and reverse older jumps so that the jump index directly
"   corresponds to the count of the jump.
"* ASSUMPTIONS / PRECONDITIONS:
"   None.
"* EFFECTS / POSTCONDITIONS:
"   None.
"* INPUTS:
"   a:jumps List of jump lines from :jumps or :changes command.
"   a:isNewer	Flag whether the jump is to newer jumps.
"* RETURN VALUES:
"   Rearranged slice of jumps; the jump index corresponds to the jump count.
"******************************************************************************
    let l:currentIndex = s:GetCurrentIndex(a:jumps)
    if a:isNewer
	return a:jumps[(l:currentIndex + 1) : ]
    else
	return (l:currentIndex == 0 ? [] : reverse(a:jumps[ : (l:currentIndex - 1)]))
    endif
endfunction

function! EnhancedJumps#Common#ParseJumpLine( jumpLine )
    " Parse one line of output from :jumps into object with count, lnum, col, text.
    let l:parseResult = matchlist(a:jumpLine, '^>\?\s*\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(.*\)$')
    return {
    \	'count': get(l:parseResult, 1, 0),
    \	'lnum' : get(l:parseResult, 2, 0),
    \	'col'  : get(l:parseResult, 3, 0),
    \	'text' : get(l:parseResult, 4, '')
    \}
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
