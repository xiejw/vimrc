" =============================================================================
" General Settings.
syntax on
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
set colorcolumn=100
set wildmode=longest:full " emacs-style filename matching
set wildmenu
filetype plugin indent on
filetype plugin on
set nospell "set spell spelllang=en_us
set completeopt=longest,menuone " set completeopt-=preview

" =============================================================================
" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline', {'commit': 'f86f1e8' }  " 2017-06
Plug 'tomasr/molokai', {'commit': 'c67bdfc' }  " 2017-06
call plug#end()

" vim-airline
"" Setup the fonts for ubuntu. Follow https://github.com/powerline/fonts and
"" select the font in termial profile (say xfce4-terminal with Droid Sans Mno
"" Dotted for Powerline 9).
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
set laststatus=2

" =============================================================================
" Color
set background=dark " background must be set before colorscheme
colorscheme molokai
"" This makes the comment visible in terminal (usually default is blue).
highlight Comment ctermfg=DarkGreen
"" This makes the visual selection more visible.
hi visual ctermbg=DarkMagenta

"" =============================================================================
" Shows a list to select for most recent files.
" Here we use the v:oldfiles to do the proxy.
function! LoadRecentFiles()
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

" =============================================================================
" Shows a list to select for all pending files in current repo, and then opens it.
let g:load_pending_files_cmd='git diff --name-only'

function! LoadPendingFiles()
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

" =============================================================================
" Define a Func: Delete tailing white space before write.
function! <SID>DelEmptyLinesEnd()
  let l = line(".")
  let c = col(".")
  :%s/\s\+$//e
  call cursor(l, c)
endfunction
autocmd FileType c,cpp,go,python,sh,vim
  \ autocmd BufWritePre * :call <SID>DelEmptyLinesEnd()

" =============================================================================
" leader
let mapleader = ","
"" Navigation for buffers
nmap <silent> <leader>b :bn <CR>
nmap <silent> <leader>B :bp <CR>
nmap <silent> <leader>t :tabn <CR>
nmap <silent> <leader>T :tabp <CR>
"" Some switches for spell, paste, etc
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
nmap <silent> <leader>s :set spell<CR>
nmap <silent> <leader>ns :set nospell<CR>
"" List the old files to open
nmap <silent> <leader>lb :call LoadRecentFiles()<CR>
nmap <silent> <leader>ll :call LoadPendingFiles()<CR>
"" Open files related.
nmap <silent> <leader>ee :e %:p:h/
nmap <silent> <leader>et :tabnew %:p:h/
" nmap <silent> <leader>rt :call <SID>DelEmptyLinesEnd()<CR>
" nmap <silent> <leader>r :redraw!<CR>:e<CR>
" nmap <silent> <leader>b  :CtrlPBuffer<CR>
