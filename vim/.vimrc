" .vimrc
" Sam Harrison 2018
" MIT License: a full version of the license is included in the LICENSE file

" References
" https://dougblack.io/words/a-good-vimrc.html

set encoding=utf-8

syntax enable

set expandtab      " Spaces are tabs
set softtabstop=4  " Pressing tab inserts four spaces
set tabstop=4      " Tabs look like four spaces
set shiftwidth=4   " Spaces for auto-indent

" Highlight tabs and trailing whitespace
" https://vi.stackexchange.com/a/423
set list
set listchars=tab:├─,trail:·

"set number  " show line numbers

set autoindent
filetype indent on  " Indentation based on filetype

colorscheme lucius
LuciusWhiteLowContrast  " Lucius[Black|Dark|Light|White][HighContrast|LowContrast]

set cursorline  " Highlight current line

