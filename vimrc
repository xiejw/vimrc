" {{{1 General Settings.
syntax on
" {{{3 Configuration at global level.
set mouse=a
set nocompatible
set autoread
set splitright
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set cindent
set ignorecase
set infercase " rememer the case which has been typed so far when auto-complete.
set novisualbell " if not, weird char on Ubuntu terminal.
set showcmd
set nu
set ruler
set vb
set incsearch
set encoding=utf8
set nofoldenable
set foldlevel=2
set colorcolumn=80
set wildmode=longest:full " emacs-style filename matching
set wildmenu
filetype plugin indent on
filetype plugin on
set nospell "set spell spelllang=en_us
set completeopt=longest,menuone " set completeopt-=preview

" {{{2 End.

" {{{1 Vim-Plug
call plug#begin('~/.vim/plugged')

" {{{3 Airline.
Plug 'vim-airline/vim-airline', {'commit': 'f86f1e8' }  " 2017-06
"" Setup the fonts for ubuntu. Follow https://github.com/powerline/fonts and
"" select the font in termial profile (say xfce4-terminal with Droid Sans Mno
"" Dotted for Powerline 9).
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
set laststatus=2

" {{{3 Molokai.
Plug 'tomasr/molokai', {'commit': 'c67bdfc' }  " 2017-06

" {{{3 Fzf.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin', 'commit': 'b13fcfd'} " 2017-07
Plug 'junegunn/fzf.vim', {'commit': '55f6bc8'}  " 2017-07

" {{{3 Tagbar.
Plug 'majutsushi/tagbar', {'commit': '387bbad'}  " 2017-12.
let g:tagbar_width=50
let g:tagbar_sort=0
call gotags#Init()  " Initialize the gotags configuration for tagbar.

" {{{3 Dracula.
Plug 'dracula/vim', {'commit': '6a5bf34'}  " 2017-12

" {{{3 Current Word.
Plug 'dominikduda/vim_current_word', {'commit': '58eac40'}  " 2017-12


" {{{3 IndentLine.
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0

" {{{2 End.
call plug#end()

" {{{1 Ctags.
" {{{3
set notagrelative

function! LoadTagFiles(golden_list)
  let existed_list = []
  for tag_file in a:golden_list
    if filereadable(expand(tag_file))
      call add(existed_list, expand(tag_file))
    endif
  endfor
  let final_list = join(existed_list, ';')
  let &tags=final_list
endfunction

call LoadTagFiles(['.ctags', '~/.ctags'])

" {{{2 End.

" {{{1 Colors.
" Color. See https://github.com/guns/xterm-color-table.vim
set background=dark " background must be set before colorscheme
colorscheme dracula

" {{{3 Color Adjust.
"" This makes the comment visible in terminal (usually default is blue).
"" highlight Comment ctermfg=DarkGreen
"" This makes the visual selection more visible. 166 is orange.
"" hi visual ctermbg=166
"" This makes the Pop menu more visible. 166 is orange.
hi Pmenu ctermbg=236
hi PmenuSel ctermbg=166

" {{{3 Old Stuff.
" colorscheme Tomorrow-Night
" colorscheme molokai

" {{{2 End.

" {{{1 Leaders.
let mapleader = ","
" {{{3 Navigation for buffers.
nmap <silent> <leader>b :bn! <CR>
nmap <silent> <leader>B :bp! <CR>
nmap <silent> <leader>t :tabn <CR>
nmap <silent> <leader>T :tabp <CR>
" {{{3 Some switches for spell, paste, etc.
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
nmap <silent> <leader>s :set spell<CR>
nmap <silent> <leader>ns :set nospell<CR>
" {{{3 List the files to open, such as recent files, pending files in git.
nmap <silent> <leader>lb :call fns#LoadRecentFiles()<CR>
nmap <silent> <leader>ll :call fns#LoadPendingFiles()<CR>
" {{{3 Open files related.
nmap <silent> <leader>ee :e %:p:h/
nmap <silent> <leader>et :tabnew %:p:h/
" {{{3 Surround `` around a word.
nmap <silent> <leader>` bi`<esc>wea`<esc>
" {{{4 FZF
nmap <silent> <leader>z :FZF<cr>
" {{{2 End.
"
" {{{1 Other Mappings.
imap <tab> <c-x><c-p>
nmap <space> za
imap jk <esc>
" {{{3 TagBar. See https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt#L243
"" map <c-t> <esc>:TagbarToggle<cr>
map <c-j> <esc>:TagbarOpen fjc<cr>
"" {{{3 IndentLines. See https://github.com/Yggdroot/indentLine
map <c-i> <esc>:IndentLinesToggle<cr>
" {{{2 End.

" {{{1 Filetype Related.
" {{{3 DelEmptyLinesEnd.
autocmd FileType c,cpp,go,python,sh,vim,make
  \ autocmd BufWritePre * :call fns#DelEmptyLinesEnd()

" {{{3 Vim.
autocmd FileType vim :setlocal foldmethod=indent

" {{{3 Go.
autocmd FileType go :setlocal tw=80 colorcolumn=80
autocmd FileType go :setlocal foldenable foldlevel=1 foldcolumn=2 foldnestmax=2
autocmd FileType go :setlocal foldmethod=indent

" {{{3 Markdown.
autocmd FileType markdown :setlocal tw=80 colorcolumn=80
autocmd FileType markdown :setlocal foldenable foldlevel=2 foldcolumn=2
autocmd FileType markdown :setlocal foldmethod=expr foldexpr=GetMarkdownFold(v:lnum)

function! GetMarkdownFold(lnum)
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

" {{{3 Python.
autocmd FileType python :setlocal tw=80 colorcolumn=80
autocmd FileType python :setlocal foldenable foldlevel=1 foldcolumn=2
autocmd FileType python :setlocal foldmethod=expr foldexpr=GetPythonFold(v:lnum)

function! GetPythonFold(lnum)
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
" {{{2 End.

" vim: foldenable foldmethod=marker foldlevel=2
