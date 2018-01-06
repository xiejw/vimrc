function! fold#GetPythonFold(lnum)
  let line = getline(a:lnum)
  let invisible_level = 3
  let import_level = invisible_level

  if a:lnum == 1
    return '>'. invisible_level
  endif

  if line =~? '\v^\s*$'
    return '='
  elseif line =~? '\v^from.*import'
    return import_level
  elseif line =~? '\v^import'
    return import_level
  endif

  let pline = getline(a:lnum - 1)
  let nline = getline(a:lnum + 1)

  " 2 import ..
  " 2 import ..
  " ?
  " 2 def foo():
  " 2   print
  "
  " 1 class Foo:
  " 2   def foo():
  " 2     print


  let indent_level = min([indent(a:lnum) / &shiftwidth + 1, 3])

  if line =~? '\v^def'
    return '>1'
  elseif pline =~? '\v^def'
    return '>'. invisible_level
  elseif nline =~? '\v^def'
    return '<'. invisible_level
  elseif line =~? '\v^\s*(def|class)'
    return '>'. indent_level
  elseif pline =~? '\v^\s*(def|class)'
    return '>'. invisible_level
  else
    return invisible_level

endfunction

function! fold#GetMarkdownFold(lnum)
  let line = getline(a:lnum)

  if line =~? '\v^(#)+ '
    if line =~? '\v^# '
      return '>1'
    elseif line =~? '\v^## '
      return '>2'
    elseif line =~? '\v^### '
      return '>3'
    else
      return '='
    endif
  else
    return '='
  endif
endfunction

