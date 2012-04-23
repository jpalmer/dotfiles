call pathogen#infect()
au BufRead,BufNewFile *.fs   set filetype=fsharp
au BufRead,BufNewFile sigfile set filetype=fsharp
set tabstop=4
set shiftwidth=4
set expandtab
set number
set autoindent
au BufRead,BufNewFile makefile set noexpandtab
