set nocompatible    "vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
""Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline'
Plugin 'godlygeek/tabular'
""Plugin 'spf13/vim-autoclose'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'vimoutliner/vimoutliner'
call vundle#end()
let g:ycm_extra_conf_globlist=['~/conductance/*','/data/*'] "autoload config for completion in conductance
set completeopt-=preview
let g:ycm_add_preview_to_ocmpleteopt=0
filetype plugin indent on
au BufReadPre * setlocal foldmethod=indent
let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BU   FFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as n ot a file
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
syntax on
filetype plugin indent on
set tabstop=4 ") tabs
set shiftwidth=4
set number
set autoindent
syn on
set expandtab
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
""nmap <F8> :TagbarToggle<CR>
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
set mouse=a
""get nice error window when running make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
cabbrev make make!
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 "always show status line
set guioptions-=L "hide scroll bar"
set guioptions-=r "hide scroll bar"

set colorcolumn=80
