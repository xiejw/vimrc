function! indent#GetPythonFold(lnum)
  let line = getline(a:lnum)
  let invisible_level = 2
  let import_level = invisible_level

  " 2 import ..
  " 2 import ..
  " ?
  " 2 def foo():
  " 2   print
  "
  " 1 class Foo:
  " 2   def foo():
  " 2     print

  if line =~? '\v^\s*$'
    return '='
  elseif line =~? '\v^from.*import'
    return import_level
  elseif line =~? '\v^import'
    return import_level
  endif

  let indent_level = min([indent(a:lnum) / &shiftwidth + 1, 3])

  if line =~? '\v^def'
    return '>2'
  elseif line =~? '\v^\s*(def|class)'
    return '>'. indent_level
  else
    return invisible_level

endfunction

function! indent#GetMarkdownFold(lnum)
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

