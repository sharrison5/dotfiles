" .vimrc
" Sam Harrison 2018
" MIT License: a full version of the license is included in the LICENSE file

" References
" https://dougblack.io/words/a-good-vimrc.html

set encoding=utf-8

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Spaces v tabs / indentation

set expandtab softtabstop=4  " Pressing tab inserts 4 spaces
set tabstop=4       " Any existing tabs look like four spaces
set shiftwidth=4    " Number of spaces used for auto-indent

set autoindent      " Copy indentation from previous line, unless...
filetype indent on  " More specific indentation based on filetype

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Colours!
" http://vimcolors.com
" https://github.com/noah/vim256-color

syntax enable   " Turn on syntax highlighting

colorscheme lucius
" Lucius[Black|Dark|Light|White][HighContrast|LowContrast]
LuciusWhiteLowContrast

"colorscheme summerfruit256

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Editor appearance

set cursorline  " Highlight current line
"set number     " Show line numbers

set showmatch   " Highlight matching brackets

" Highlight tabs and trailing whitespace
" https://vi.stackexchange.com/a/423
set list
set listchars=tab:├─,trail:·

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Vim behaviour

set showcmd  " Show partial commands in bottom right corner

" Enable interactive display of command autocompletion options
set wildmenu
" First tab press expands to longest common string
" Subsequent tabs then cycle through options
set wildmode=longest:full,full

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

