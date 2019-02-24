
" Return the root directory of the project that contains 'filename'. The root
" is detected by the presence of a file or directory named as the passed
" parameter 'project_marker'
function! vem_statusline#filename_format#get_project_root(filename, project_marker)
  let path = fnamemodify(a:filename, ':p:h')
  let prev_path = ''
  while path !=# prev_path
    let marker_path = path . '/' . a:project_marker
    let type = getftype(marker_path)
    if type != ''
      return path
    endif
    let prev_path = path
    let path = fnamemodify(path, ':h')
  endwhile
  return ''
endfunction

" Return the name of the current file relative to the project root
function! vem_statusline#filename_format#get_name_relative_to_project_root()
    let current_filename = expand('%:p')
    let project_marker = g:vem_statusline_project_marker
    let project_dir = vem_statusline#filename_format#get_project_root(current_filename, project_marker)
    if project_dir != ''
        let relative_filename = current_filename[len(project_dir) + 1:]
        return relative_filename
    else
        return expand('%:.')
    endif
endfunction

