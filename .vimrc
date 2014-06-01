"au BufRead,BufNewFile *.fs   set filetype=fsharp
"au BufRead,BufNewFile sigfile set filetype=fsharp
au BufReadPre * setlocal foldmethod=indent
let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        " Also in temp dir
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
augroup vimrcAutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end
execute pathogen#infect()
syntax on
filetype plugin indent on
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
nmap <F8> :TagbarToggle<CR>
") search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
") in normal mode, can use tab to jump to matching bracket
nnoremap <tab> za
vnoremap <tab> za
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
