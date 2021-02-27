runtime! archlinux.vim

set number relativenumber
set nu rnu

syntax on
filetype plugin indent on

set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Airline config
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Public Accessors
map <F2> :s/\(\(\w\)\(\w\+\)\).*/public void get\u\2\3()\r\t{\r\t\treturn \1;\r\t}/<CR>
" Public Setters
map <F3> :s/\(\(\w\)\(\w\+\)\).*/public void set\u\2\3(\1)\r\t{\r\t\tthis.\1 = \1;\r\t}/<CR>

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
autocmd InsertLeave * silent !echo -ne "\e[2 q"
autocmd BufWritePost *html !./py.sh <afile>
augroup END
