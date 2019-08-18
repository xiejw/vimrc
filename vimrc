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
set backspace=2
set expandtab
set cindent
set noignorecase
set noinfercase  " case sensitive for auto-complete.
set novisualbell " if not, weird char on Ubuntu terminal.
set showcmd
set nu
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

" {{{3 Swift-lang.
Plug 'keith/swift.vim', {'commit': '5e330f0' }  " 2018-11

" {{{3 Fzf.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin', 'commit': 'b13fcfd'} " 2017-07
Plug 'junegunn/fzf.vim', {'commit': '55f6bc8'}  " 2017-07

" {{{3 Tagbar.
Plug 'majutsushi/tagbar', {'commit': '387bbad'}  " 2017-12.
let g:tagbar_width=50
let g:tagbar_sort=0
call gotags#Init()  " Initialize the gotags configuration for tagbar. Defined in autoload/gotags.vim.

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

" {{{2 End.

" {{{1 Leaders.
let mapleader = ","
set timeoutlen=500
" {{{3 Refresh the file content.
nmap <silent> <leader>r :e! <CR>
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
" {{{3 FZF
nmap <silent> <leader>zz :FZF<cr>
nmap <silent> <leader>zt :Tags<cr>
" {{{3 Surround `` around a word.
nmap <silent> <leader>` bi`<esc>wea`<esc>
" {{{2 End.
"
" {{{1 Other Mappings.
" Kill the current buffer without losing split.
nmap <silent> <leader>d :bp \| bd #<CR>
imap <tab> <c-x><c-p>
nmap <space> zO
nmap <space><space> zX
imap jk <esc>
inoremap <C-]> <C-\><C-o>:w<CR><esc>

" {{{3 TagBar. See https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt#L243
"" map <c-t> <esc>:TagbarToggle<cr>
map <c-j> <esc>:TagbarOpen fjc<cr>
"" {{{3 IndentLines. See https://github.com/Yggdroot/indentLine
map <c-i> <esc>:IndentLinesToggle<cr>
" {{{2 End.

" {{{1 Filetype Related.
" {{{3 DelEmptyLinesEnd.
autocmd FileType c,cpp,go,python,sh,vim,make,markdown,plaintex,swift
  \ autocmd BufWritePre * :call fns#DelEmptyLinesEnd()

" {{{3 Vim.
autocmd FileType vim :setlocal foldenable foldlevel=2 foldmethod=marker

" {{{3 Go.
autocmd FileType go :setlocal tw=80 colorcolumn=80
autocmd FileType go :setlocal foldlevel=0 foldnestmax=2
autocmd FileType go :setlocal foldmethod=indent noexpandtab
autocmd FileType go :setlocal comments=:// fo=tcrqo
" Automatically open a pair of bracket
autocmd FileType go :noreab { {<esc>o}<esc>ko
" The list \s*-\s* in comments. The comments '//' are not part of flp.
autocmd FileType go :setlocal formatoptions+=n flp=^\\s*-\\s*

" {{{3 Swift.
autocmd FileType swift :setlocal tw=100 colorcolumn=100
autocmd FileType swift :setlocal shiftwidth=4
autocmd FileType swift :setlocal foldenable foldlevel=1
autocmd FileType swift :setlocal foldmethod=indent
autocmd FileType swift :setlocal comments=:///,:// fo=tcrqo

" {{{3 Markdown.
autocmd FileType markdown :setlocal tw=80 colorcolumn=80
autocmd FileType markdown :setlocal foldenable foldlevel=2
autocmd FileType markdown :setlocal foldmethod=expr foldexpr=fold#GetMarkdownFold(v:lnum)
autocmd FileType markdown :setlocal nocindent

" {{{3 Makefile.
autocmd FileType make :setlocal tw=80 colorcolumn=80
autocmd FileType make :setlocal foldenable foldlevel=1
autocmd FileType make :setlocal foldmethod=marker
autocmd FileType make :setlocal nocindent

" {{{3 Python.
autocmd FileType python :setlocal tw=80 colorcolumn=80
autocmd FileType python :setlocal foldlevel=1
autocmd FileType python :setlocal foldmethod=expr foldexpr=fold#GetPythonFold(v:lnum)

" {{{3 Tex
autocmd FileType plaintex :setlocal foldenable foldlevel=1 foldmethod=marker
autocmd FileType plaintex :setlocal tw=80
autocmd FileType plaintex :setlocal nocindent
" Customize the listing formating ^\*\s according OPmac. So ::help fo-table
autocmd FileType plaintex :setlocal formatoptions+=n flp=^\\*\\s

" {{{2 End.

" {{{1 Diff relaed.
if &diff
  " {{{3 Mappings.
  nmap n ]c
  nmap p [c
  nmap <c-n> <esc>:qa<cr>

  " {{{3 Colors.

  " DiffAdd - line was added
  " DiffDelete - line was removed
  " DiffChange - part of the line was changed (highlights the whole line)
  " DiffText - the exact part of the line that changed
  highlight DiffChange cterm=bold ctermfg=10 ctermbg=239
  highlight DiffText   cterm=bold ctermfg=201 ctermbg=239

endif
" {{{2 End.

