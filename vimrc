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
set colorcolumn=80
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
Plug 'pseewald/vim-anyfold', {'commit': 'becb19a'}  " 2017-06
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin', 'commit': 'b13fcfd'} " 2017-07
Plug 'junegunn/fzf.vim', {'commit': '55f6bc8'}  " 2017-07
call plug#end()

" vim-airline
"" Setup the fonts for ubuntu. Follow https://github.com/powerline/fonts and
"" select the font in termial profile (say xfce4-terminal with Droid Sans Mno
"" Dotted for Powerline 9).
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
set laststatus=2

let anyfold_activate=1
set foldlevel=0

" =============================================================================
" Color. See https://github.com/guns/xterm-color-table.vim
set background=dark " background must be set before colorscheme
" colorscheme Tomorrow-Night
colorscheme monokai

""""" All the following settings are required for molokai.
" colorscheme molokai
"" This makes the comment visible in terminal (usually default is blue).
"" highlight Comment ctermfg=DarkGreen
"" This makes the visual selection more visible. 166 is orange.
"" hi visual ctermbg=166

" =============================================================================
" leader
let mapleader = ","
"" Navigation for buffers
nmap <silent> <leader>b :bn! <CR>
nmap <silent> <leader>B :bp! <CR>
nmap <silent> <leader>t :tabn <CR>
nmap <silent> <leader>T :tabp <CR>
"" Some switches for spell, paste, etc
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
nmap <silent> <leader>s :set spell<CR>
nmap <silent> <leader>ns :set nospell<CR>
"" List the files to open, such as recent files, pending files in git.
nmap <silent> <leader>lb :call fns#LoadRecentFiles()<CR>
nmap <silent> <leader>ll :call fns#LoadPendingFiles()<CR>
"" Open files related.
nmap <silent> <leader>ee :e %:p:h/
nmap <silent> <leader>et :tabnew %:p:h/
"" Surround `` around a word.
nmap <silent> <leader>` bi`<esc>wea`<esc>

" =============================================================================
" Mappings.
nmap <space> za
nmap z<space> zA
""" Open fold the block under cursor.
nmap ZZ :call fns#FoldEverywhereElse()<CR>
imap <tab> <c-x><c-p>
""" Write file.
map <c-s> <esc>:write<cr>

" =============================================================================
" filetype related
autocmd FileType c,cpp,go,python,sh,vim
  \ autocmd BufWritePre * :call fns#DelEmptyLinesEnd()

autocmd FileType vim :setlocal foldmethod=indent

autocmd FileType python :setlocal tw=80 colorcolumn=80
