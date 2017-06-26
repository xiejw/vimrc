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
" Color
"" This make the comment visible in terminal (usually default is blue).
highlight Comment ctermfg=green

" =============================================================================
" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
set laststatus=2

" =============================================================================
" leader
let mapleader = ","
"" buffer next and previous
nmap <silent> <leader>b :bn <CR>  
nmap <silent> <leader>B :bp <CR>  
" nmap <silent> <leader>rt :call <SID>DelEmptyLinesEnd()<CR>
" nmap <silent> <leader>rs :syntax sync fromstart<CR>
" nmap <silent> <leader>r :redraw!<CR>:e<CR>
" nmap <silent> <leader>w :w <CR>
" nmap <silent> <leader>q Vgq <CR>
" nmap <silent> <leader>te :tabnew<CR>
" nmap <silent> <leader>ee :tabnew %:p:h/
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>
" nmap <silent> <leader>c  :w <CR>  : !make <CR><CR>
" nmap <silent> <leader>p  :cd %:p:h<CR>
" nmap <silent> <leader>t  :FZF<CR>
" nmap <silent> <leader>b  :CtrlPBuffer<CR>
