"au BufRead,BufNewFile *.fs   set filetype=fsharp
"au BufRead,BufNewFile sigfile set filetype=fsharp
set tabstop=4 ") tabs
set shiftwidth=4
set number
set autoindent
syn on
set expandtab
au BufRead,BufNewFile makefile set noexpandtab
set guifont=Droid\ Sans\ Mono\ 10
") remap keys - first part stops arrow keys, second makes j,k move by screen line rather than file line
nnoremap ; :
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <End> g<End>
nnoremap <Home> g<Home>
") search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
") in normal mode, can use tab to jump to matching bracket
nnoremap <tab> %
vnoremap <tab> %
set wildmenu
set wildmode=list:longest,full
set cursorline
set ttyfast
set ruler
map <C-V>   	"+gP
imap <C-V>      <Esc>l"+gPi
set mouse=a
""get nice error window when running make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
cabbrev make make!
