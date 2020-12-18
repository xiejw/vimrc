" vim:

" ------------------------------------------------------------------------------
" general settings.
" ------------------------------------------------------------------------------
syntax on

set mouse=a
set nocompatible
set splitright
set shiftwidth=2
set tabstop=2
set softtabstop=2
set backspace=2
set expandtab
set cindent
set noignorecase
set noinfercase  " case sensitive for auto-complete.
set novisualbell " if not, weird char on Ubuntu terminal.
set showcmd
set nu rnu  " hybrid line numbers
set ruler
set vb
set modeline
set modelines=5 " Must be set to enable modeline
set incsearch
set encoding=utf8
set nofoldenable
set foldlevel=1
set foldcolumn=0
set colorcolumn=80
set wildmode=longest:full " emacs-style filename matching
set wildmenu
filetype plugin indent on
filetype plugin on
set nospell "set spell spelllang=en_us
set completeopt=longest,menuone " set completeopt-=preview
" Ask vim to check file timestamp (checktime). Once detected new change, due
" to `autoread`, the content will be loaded.
au CursorHold * checktime
set autoread


" ------------------------------------------------------------------------------
" vim plugs
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" --------
" airline.
" --------
Plug 'vim-airline/vim-airline', {'commit': 'f86f1e8' }  " 2017-06
"" Setup the fonts for ubuntu. Follow https://github.com/powerline/fonts and
"" select the font in termial profile (say xfce4-terminal with Droid Sans Mno
"" Dotted for Powerline 9).
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
set laststatus=2

" ----
" fzf.
" ----
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin', 'commit': 'b13fcfd'} " 2017-07
Plug 'junegunn/fzf.vim', {'commit': '55f6bc8'}  " 2017-07

"---------
" dracula.
"---------
Plug 'dracula/vim', {'commit': 'b64b22a'} " 2020-08
" adjust: disable italic fonts to avoid the background highligh bugs. See
"   https://github.com/dracula/vim/issues/81
let g:dracula_italic = 0

" -------------
" current Word.
" -------------
Plug 'dominikduda/vim_current_word', {'commit': '58eac40'}  " 2017-12
let g:vim_current_word#highlight_current_word = 0

" -----------
" indentLine.
" -----------
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0

call plug#end()

" ------------------------------------------------------------------------------
" colors.
" ------------------------------------------------------------------------------

" --------
" dracula.
" --------
set background=dark " background must be set before colorscheme
colorscheme dracula

" ------------------
" color adjustments.
" ------------------
" change comment to darg green. makes it visible in terminal (usually is blue).
highlight Comment ctermfg=DarkGreen
"" make the visual selection more visible. 166 is orange.
hi visual ctermbg=166
"" makes the pop up menu more visible. 166 is orange.
hi PmenuSel ctermfg=White ctermbg=166

" ------------------------------------------------------------------------------
" leaders.
" ------------------------------------------------------------------------------
let mapleader = ","
set timeoutlen=500

" ---------------------------------
" refresh or save the file content.
" ---------------------------------
nmap <silent> <leader>r :e! <CR>
nmap <silent> <leader>s :update<CR>

" -----------------------
" navigation for buffers.
" -----------------------
nmap <silent> <leader>b :bn! <CR>
nmap <silent> <leader>B :bp! <CR>
nmap <silent> <leader>t :tabn <CR>
nmap <silent> <leader>T :tabp <CR>

" ------------------------------------
" some switches for spell, paste, etc.
" ------------------------------------
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
" nmap <silent> <leader>s :set spell<CR> " conflicted with save
" nmap <silent> <leader>ns :set nospell<CR>

" -------------------------------------------------------------------
" list the files to open, such as recent files, pending files in git.
" -------------------------------------------------------------------
nmap <silent> <leader>lb :call fns#LoadRecentFiles()<CR>
nmap <silent> <leader>ll :call fns#LoadPendingFiles()<CR>

" ----
" fzf.
" ----
nmap <silent> <leader>zz :FZF<cr>

" -------------------
" open files related.
" -------------------
nmap <silent> <leader>ee :e %:p:h/
nmap <silent> <leader>et :tabnew %:p:h/

" ---------------------
" put `` around a word.
" ---------------------
nmap <silent> <leader>` bi`<esc>wea`<esc>

" ------------------------------------------------------------------------------
" other Mappings.
" ------------------------------------------------------------------------------

" ---------------------------------------------
" kill the current buffer without losing split.
" ---------------------------------------------
nmap <silent> <leader>d :bp \| bd #<CR>
imap <tab> <c-x><c-p>
nmap <space> zO
nmap <space><space> zX
imap jk <esc>:update<CR>
map <c-i> <esc>:IndentLinesToggle<cr>


" ------------------------------------------------------------------------------
" filetype Related.
" ------------------------------------------------------------------------------
"
" {{{3 DelEmptyLinesEnd.
autocmd BufWritePre * :call fns#DelEmptyLinesEnd()

" {{{3 vim.
autocmd FileType vim :setlocal foldlevel=2 foldmethod=marker

" {{[3 c
autocmd BufRead,BufNewFile *.h set filetype=c
autocmd FileType c :match Todo /\<_mut_\|OK\|ERROR\>/

" {{{3 go.
autocmd FileType go :setlocal tw=100 colorcolumn=100
autocmd FileType go :setlocal foldlevel=0 foldnestmax=2
autocmd FileType go :setlocal foldmethod=indent noexpandtab
autocmd FileType go :setlocal comments=:// fo=tcrqo
" The list \s*-\s* in comments. The comments '//' are not part of flp.
autocmd FileType go :setlocal formatoptions+=n flp=^\\s*-\\s*

" {{{3 text.
autocmd FileType text :setlocal tw=80 colorcolumn=80 nocindent
autocmd FileType text :setlocal nocindent
autocmd FileType text :setlocal smartindent

" {{{3 markdown.
autocmd FileType markdown :setlocal tw=80 colorcolumn=80
autocmd FileType markdown :setlocal foldlevel=2
autocmd FileType markdown :setlocal foldmethod=expr foldexpr=fold#GetMarkdownFold(v:lnum)
autocmd FileType markdown :setlocal nocindent
"" The following two lines are used number list.
"" autoindent is used for indenting the third line and so on.
"" The regexp is for number 1.\ and bullet -\
autocmd FileType markdown :setlocal autoindent
autocmd FileType markdown :setlocal formatoptions+=n flp=^\\s*\\(\\d\\+\\.\\\\|-\\)\\s

" {{{3 makefile.
autocmd FileType make :setlocal tw=80 colorcolumn=80
autocmd FileType make :setlocal foldlevel=1
autocmd FileType make :setlocal foldmethod=marker
autocmd FileType make :setlocal nocindent

" {{{3 python.
autocmd FileType python :setlocal tw=80 colorcolumn=80
autocmd FileType python :setlocal shiftwidth=4
autocmd FileType python :setlocal foldlevel=1
autocmd FileType python :setlocal foldmethod=expr foldexpr=fold#GetPythonFold(v:lnum)

" {{{3 plain tex
autocmd FileType plaintex :setlocal foldlevel=1 foldmethod=marker
autocmd FileType plaintex :setlocal tw=80
autocmd FileType plaintex :setlocal nocindent
" Customize the listing formating ^\*\s according OPmac. So ::help fo-table
" autocmd FileType plaintex :setlocal formatoptions+=n flp=^\\*\\s
" Autoindent is required for inserting the indent correctly.
autocmd FileType plaintex :setlocal formatoptions=tcq2
autocmd FileType plaintex :setlocal autoindent

