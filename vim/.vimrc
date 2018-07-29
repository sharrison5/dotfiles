" .vimrc
" Sam Harrison 2018
" MIT License: a full version of the license is included in the LICENSE file

" References
" https://dougblack.io/words/a-good-vimrc.html

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Text-based options

set encoding=utf-8

" Spellchecking
"set spell
set spelllang=en_gb

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Spaces v tabs / indentation

set expandtab softtabstop=4  " Pressing tab inserts 4 spaces
set shiftwidth=4    " Number of spaces used for auto-indent
set tabstop=8       " Any existing tabs look like 8 spaces (default)

set autoindent      " Copy indentation from previous line, unless...
filetype on         " Detect filetype
filetype plugin on  " Tweak editor behaviour based on filetype
filetype indent on  " And use file-specific indentation behaviour

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

set nowrap      " Long lines don't break

set cursorline  " Highlight current line
"set number     " Show line numbers

set showmatch   " Highlight matching brackets

" Highlight tabs and trailing whitespace
" https://vi.stackexchange.com/a/423
set list
set listchars=tab:├─,trail:·

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Vim behaviour

set showcmd       " Show partial commands in bottom right corner

set laststatus=2  " Always show the status line
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" Basic syntax: %-0{minwid}.{maxwid}{item}
set statusline=
set statusline+=\ %n)       " Buffer number
set statusline+=\ %.30f     " Path to file (truncated to 30 chars)
set statusline+=\ %y        " [filetype]
set statusline+=\ [         " [encoding, modifiable, read only]
set statusline+=%{(&fenc!=''?&fenc:&enc)}
set statusline+=%M
set statusline+=%R
set statusline+=]
set statusline+=%=          " Switch to right-hand side
set statusline+=%l/%L:%-2c\ " Current/total lines : column

" Enable interactive display of command autocompletion options
set wildmenu
" First tab press expands to longest common string
" Subsequent tabs then cycle through options
set wildmode=longest:full,full

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

