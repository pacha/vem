" EnhancedJumps.vim: Enhanced jump list navigation commands.
"
" DEPENDENCIES:
"   - EnhancedJumps/Common.vim autoload script
"   - ingo/avoidprompt.vim autoload script
"   - ingo/buffer/locate.vim autoload script
"   - ingo/compat.vim autoload script
"   - ingo/err.vim autoload script
"   - ingo/msg.vim autoload script
"   - ingo/record.vim autoload script
"
" Copyright: (C) 2009-2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
let s:save_cpo = &cpo
set cpo&vim

function! s:FilterDuplicateSubsequentFiles( jumps, isNewer )
"****D echo join(a:jumps, "\n")
    " Always jump to the latest file position, also when jumping to newer files.
    " This way, the same position is maintained when jumping older and newer.
    " Otherwise, the newer jumps would always start at the top of the file (or
    " remembered file position) - not very useful.
    let l:uniqueJumps = []
    let l:prevParsedJump = EnhancedJumps#Common#ParseJumpLine('')
    for l:i in (a:isNewer ?
    \	range(len(a:jumps) - 1, 0, -1) :
    \	range(len(a:jumps))
    \)
	let l:currentParsedJump = EnhancedJumps#Common#ParseJumpLine(a:jumps[l:i])
	" Include the current jump if it's a different file or there are other
	" local jumps in between (i.e. the jump counts are not sequential).
	if l:currentParsedJump.text !=# l:prevParsedJump.text ||
	\   l:currentParsedJump.count != (l:prevParsedJump.count + (a:isNewer ? -1 : 1))
	    if a:isNewer
		call insert(l:uniqueJumps, a:jumps[l:i], 0)
	    else
		call add(l:uniqueJumps, a:jumps[l:i])
	    endif
	endif
	let l:prevParsedJump = l:currentParsedJump
    endfor
"****D echo "****\n" join(l:uniqueJumps, "\n")
    return l:uniqueJumps
endfunction
function! s:FilterJumps( jumps, filter, isNewer )
    if empty(a:filter)
	return a:jumps
    elseif a:filter ==# 'local'
	return filter(a:jumps, 's:IsJumpInCurrentBuffer(EnhancedJumps#Common#ParseJumpLine(v:val))')
    elseif a:filter ==# 'remote'
	return s:FilterDuplicateSubsequentFiles(
	\   filter(a:jumps, '! s:IsJumpInCurrentBuffer(EnhancedJumps#Common#ParseJumpLine(v:val))'),
	\   a:isNewer
	\)
    else
	throw 'ASSERT: Unknown filter type ' . string(a:filter)
    endif
endfunction
function! s:GetCount()
    " Determine whether this is a repetition of the same jump command that got
    " stuck on the warning about jumping into another buffer.
    let l:wasStopped = (exists('t:lastJumpCommandCount') && t:lastJumpCommandCount)
    if l:wasStopped
	" If no [count] is given on this repetition, re-use the [count]
	" from the initial jump command that got stuck on the warning.
	return (v:count ? v:count1 : t:lastJumpCommandCount)
    else
	" This isn't a repetition; use the supplied [count].
	return v:count1
    endif
endfunction
function! s:BufferName( jumpText )
    return (empty(a:jumpText) ? '[No name]' : a:jumpText)
endfunction
function! s:WasLastStop( current, record )
    return (! empty(a:current) && ! empty(a:record) && a:current[0:-2] == a:record[0:-2]) && (a:current[-1] - a:record[-1] <= (g:stopFirstAndNotifyTimeoutLen / 1000))
endfunction
function! s:IsInvalid( text )
    if a:text ==# '-invalid-'
	" Though invalid jumps are caused by marks in another (modified) file,
	" treat them as belonging to the current buffer; after all, Vim doesn't
	" move to that file, and just prints the "E19: Mark has invalid line
	" number" error.
	return 1
    endif
endfunction
function! s:IsJumpInCurrentBuffer( parsedJump )
    if empty(a:parsedJump.text)
	" In case there is no jump text, the corresponding line in the current
	" buffer also should be empty.
	let l:regexp = '^$'
    else
	" The jump text omits any indent, may be truncated and has non-printable
	" characters rendered as ^X (so any ^X substring may either represent a
	" non-printable single character or the literal two-character ^X
	" sequence). The regexp has to consider this.
	let l:regexp = '\V' . substitute(escape(a:parsedJump.text, '\'), '\^\%(\\\\\|\p\)', '\\%(\0\\|\\.\\)', 'g')
    endif
"****D echomsg '****' l:regexp
    return getline(a:parsedJump.lnum) =~# l:regexp
endfunction
function! EnhancedJumps#Jump( targetJump, count, isNewer )
    if a:count == 0
	execute "normal! \<C-\>\<C-n>\<Esc>"
	return 0
    endif

    try
	" There's just a beep when there's no newer/older jump position; this is
	" not a Vim error, so no exception is thrown.
	" We check the position before and after the jump to detect its success
	" in all cases.
	let l:originalPosition = ingo#record#Position(0)
	execute 'normal!' a:count . (a:isNewer ? "\<C-i>" : "\<C-o>")
	if ingo#record#Position(0) == l:originalPosition
	    return 0
	endif

	" When typed, CTRL-I/O open the fold at the jump target, but inside a
	" mapping or :normal this must be done explicitly via 'zv'.
	normal! zv

	return 1
    catch /^Vim\%((\a\+)\)\=:/
	" A Vim error occurs when there's an invalid jump position.
	call ingo#err#SetVimException('EnhancedJumps')
	return 0
    endtry
endfunction
function! EnhancedJumps#Switch( targetJump, count, isNewer )
    if a:count == 0
	execute "normal! \<C-\>\<C-n>\<Esc>"
	return 0
    endif
    let l:target = EnhancedJumps#Common#ParseJumpLine(a:targetJump)
    if ! s:IsJumpInCurrentBuffer(l:target)
	let l:bufnr = bufnr(ingo#escape#file#bufnameescape(l:target.text, 1, 0))
	if l:bufnr != -1 && bufnr('') != l:bufnr
	    let [l:tabPageNr, l:winNr] = ingo#buffer#locate#Window(g:EnhancedJumps_SwitchStrategy, g:EnhancedJumps_UseTab, l:bufnr)
	    if l:winNr == 0
		execute "normal! \<C-\>\<C-n>\<Esc>" | " Beep.
		return 0
	    endif
	    if l:tabPageNr != 0
		execute l:tabPageNr . 'tabnext'
	    endif
	    execute l:winNr . 'wincmd w'

	    call cursor(l:target.lnum, l:target.col)
	    normal! m'

	    return 1
	endif
    endif

    return EnhancedJumps#Jump(a:targetJump, a:count, a:isNewer)
endfunction
function! s:Echo( fileJumpMessages, message )
    if empty(a:fileJumpMessages)
	echo ingo#avoidprompt#Truncate(a:message)
    elseif &cmdheight > 1 || len(a:fileJumpMessages) > 1
	for l:message in a:fileJumpMessages
	    echomsg l:message
	endfor
	echo ingo#avoidprompt#Truncate(a:message)
    else
	let l:message = ingo#avoidprompt#Truncate(a:message, ingo#compat#strdisplaywidth(a:fileJumpMessages[0]) + 1)    " The captured jump message may contain unprintable or non-ASCII characters; use strdisplaywidth().
	echomsg a:fileJumpMessages[0] . (empty(l:message) ? '' : ' ')
	echon l:message
    endif
endfunction
function! s:EchoFollowingMessage( followingJump, jumpDirection, filterName, fileJumpMessages )
    let l:following = EnhancedJumps#Common#ParseJumpLine(a:followingJump)
    if empty(a:followingJump)
	redraw
	call s:Echo(a:fileJumpMessages, printf('No %s%s jump position', a:jumpDirection, a:filterName))
    elseif s:IsInvalid(l:following.text)
	redraw
	call s:Echo(a:fileJumpMessages, printf('Next%s jump position is invalid', a:filterName))
    elseif s:IsJumpInCurrentBuffer(l:following)
	let l:header = printf('next%s: %d,%d ', a:filterName, l:following.lnum, l:following.col)
	call s:Echo(a:fileJumpMessages, l:header)
	let l:reservedColumns = len(l:header)	" l:header is printable ASCII-only, so can use len() for text width.
	if len(a:fileJumpMessages) == 1 && &cmdheight == 1
	    let l:reservedColumns += ingo#compat#strdisplaywidth(a:fileJumpMessages[0], l:reservedColumns) + 1  " The captured jump message may contain unprintable or non-ASCII characters; use strdisplaywidth(); it starts after the header, so consider its width, too.
	endif
	echohl Directory
	echon ingo#avoidprompt#Truncate(getline(l:following.lnum), l:reservedColumns)
	echohl None
    else
	call s:Echo(a:fileJumpMessages, printf('next%s: %s', a:filterName, s:BufferName(l:following.text)))
    endif
endfunction
function! EnhancedJumps#Go( JumpFuncref, isNewer, filter )
    call ingo#err#Clear('EnhancedJumps')
    let l:filterName = (empty(a:filter) ? '' : ' ' . a:filter)
    let l:jumpDirection = (a:isNewer ? 'newer' : 'older')

    let l:jumps = s:FilterJumps(EnhancedJumps#Common#SliceJumpsInDirection(EnhancedJumps#Common#GetJumps('jumps'), a:isNewer), a:filter, a:isNewer)
    let l:count = s:GetCount()

    let l:targetJump = get(l:jumps, l:count - 1, '')
    let l:followingJump = get(l:jumps, l:count, '')
"****D echomsg '****' l:targetJump
"****D echomsg '****' l:followingJump
    " In case of filtering the count for the jump command does not correspond to
    " the given count and must be retrieved from the jump line.
    let l:jumpCount = (empty(a:filter) ? l:count : EnhancedJumps#Common#ParseJumpLine(l:targetJump).count)
"****D echomsg '****' l:count l:jumpCount
    if empty(l:targetJump)
	let l:countMax = len(l:jumps)
	if l:countMax == 0
	    call ingo#err#Set(printf('No %s%s jump position', l:jumpDirection, l:filterName), 'EnhancedJumps')
	else
	    call ingo#err#Set(printf('Only %d %s%s jump position%s', l:countMax, l:jumpDirection, l:filterName, (l:countMax > 1 ? 's' : '')), 'EnhancedJumps')
	endif

	" We still execute the actual jump command, even though we've determined
	" that it won't work. The jump command will still cause the customary
	" beep.
	call call(a:JumpFuncref, [l:targetJump, l:jumpCount, a:isNewer])
    else
	let l:target = EnhancedJumps#Common#ParseJumpLine(l:targetJump)
	if s:IsInvalid(l:target.text)
	    " Do nothing here, the jump command will print an error.
	    call call(a:JumpFuncref, [l:jumpCount, a:isNewer])
	elseif s:IsJumpInCurrentBuffer(l:target)
	    " To avoid that the jump command's output overwrites the indication
	    " of the next jump position, the jump command is executed first and
	    " the indication only printed if the jump didn't cause an error.
	    if call(a:JumpFuncref, [l:targetJump, l:jumpCount, a:isNewer])
		call s:EchoFollowingMessage(l:followingJump, l:jumpDirection, l:filterName, '')
	    endif
	else
	    " The next jump would move to another buffer. Stop and notify first,
	    " and only execute the jump if the same jump command (either
	    " repeating the original [count] or completely omitting it) is
	    " executed once more immediately afterwards.
	    let l:isSameCountAsLast = (! v:count || (exists('t:lastJumpCommandCount') && t:lastJumpCommandCount == v:count1))
	    let l:wasLastJumpBufferStop = l:isSameCountAsLast &&
	    \   exists('t:lastJumpBufferStop') &&
	    \   s:WasLastStop([a:isNewer, winnr(), l:target.text, localtime()], t:lastJumpBufferStop)
	    if l:wasLastJumpBufferStop || ! empty(a:filter)
		if g:EnhancedJumps_CaptureJumpMessages
		    redir => l:fileJumpCapture
			silent call call(a:JumpFuncref, [l:targetJump, l:jumpCount, a:isNewer])
		    redir END
		else
		    let l:fileJumpCapture = ''
		    call call(a:JumpFuncref, [l:targetJump, l:jumpCount, a:isNewer])
		endif

		" After the jump to another file, the filtered list for
		" remote files becomes wrong in case the following file is
		" the same as the original file (i.e. A(original) -> B(jump)
		" -> A(following)), because that jump was initially filtered
		"  out. To correctly determine the following jump, we must
		"  re-query and re-filter the jumps.
		"  In addition, the file paths to the file may have changed
		"  due to changes in CWD / 'autochdir'.
		"  For local files the jumplist gets updated with the text for
		"  the jumps, while it only contained the buffer name before.
		let l:followingJump = get(
		\	s:FilterJumps(EnhancedJumps#Common#SliceJumpsInDirection(EnhancedJumps#Common#GetJumps('jumps'), a:isNewer), a:filter, a:isNewer),
		\	0, ''
		\)

		call s:EchoFollowingMessage(l:followingJump, l:jumpDirection, l:filterName,
		\   filter(
		\	split(l:fileJumpCapture, "\n"),
		\	'! empty(v:val)'
		\   )
		\)
	    else
		" Memorize the current jump command, context, target and time
		" (except for the [count], which is stored separately) to be
		" able to detect the same jump command.
		let t:lastJumpBufferStop = [a:isNewer, winnr(), l:target.text, localtime()]

		" Memorize the given [count] to detect the same jump command,
		" and that it need not be specified on the repetition of the
		" jump command to overcome the warning.
		let t:lastJumpCommandCount = l:count

		call ingo#msg#WarningMsg(ingo#avoidprompt#Truncate(printf('next%s: %s', l:filterName, s:BufferName(l:target.text))))
		" Signal edge case via beep.
		execute "normal! \<C-\>\<C-n>\<Esc>"

		" We stop here, and do not execute the actual jump command.
		return 1
	    endif
	endif
    endif

    let t:lastJumpBufferStop = [a:isNewer, winnr(), '', 0]
    let t:lastJumpCommandCount = 0  " This is no repetition.

    return ! ingo#err#IsSet('EnhancedJumps')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
