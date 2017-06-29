" =============================================================================
" Define a Func: Delete tailing white space before write.
function! fns#DelEmptyLinesEnd()
  let l = line(".")
  let c = col(".")
  :%s/\s\+$//e
  call cursor(l, c)
endfunction

" =============================================================================
" Shows a list to select for all pending files in current repo, and then opens it.
let g:load_pending_files_cmd=get(g:, 'load_pending_files_cmd', 'git diff --name-only')

function! fns#LoadPendingFiles()
  let file_list = split(system(g:load_pending_files_cmd))
  if len(file_list) == 0
    echo "no pending files"
    return
  endif
  let user_list = ['Choose file']
  let c = 1
  for file_path in file_list
    let item = "" . c . ". " . file_path
    call add(user_list, item)
    let c += 1
  endfor
  let answer = inputlist(user_list)
  if answer == 0
    return
  endif
  execute "e " . file_list[answer - 1]
endfunction

"" =============================================================================
" Shows a list to select for most recent files.
" Here we use the v:oldfiles to do the proxy.
function! fns#LoadRecentFiles()
  let file_list = v:oldfiles
  if len(file_list) == 0
    echo "no files"
    return
  endif
  let user_list = ['Choose file']
  let c = 1
  for file_path in file_list
    let item = "" . c . ". " . file_path
    call add(user_list, item)
    let c += 1
    if c == 10
      break
    endif
  endfor
  let answer = inputlist(user_list)
  if answer == 0
    return
  endif
  execute "e " . file_list[answer - 1]
endfunction
