" .vimrc
" Sam Harrison 2018
" MIT License: a full version of the license is included in the LICENSE file

" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" Behind the scenes {{{

" Options that affect the behaviour / performance of Vim, but that do not
" directly impact the editing workflow.
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Vi compatibility {{{

" This is already set at startup if a .vimrc is found, but gives more sane
" behaviour when re-sourcing the file.
set nocompatible

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Performance / config {{{

set lazyredraw  " Don't redraw quite so often (e.g. during macros)

set history=200 " Keep more command line history

" Allows files to set local Vim options
" Disable for security reasons, and don't want editor config in source code
set nomodeline

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Text-based options {{{

set encoding=utf-8

"set autoread  " Update buffers with external changes if unmodified

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" }}}
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" Interaction {{{

" Settings which affect the way one interacts with text / Vim itself.
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Commands {{{

" Enable interactive display of command autocompletion options
set wildmenu
" First tab press expands to longest common string
" Subsequent tabs then cycle through options
set wildmode=longest:full,full

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Movement {{{

set scrolloff=3  " Always keep a few lines above/below cursor

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Text editing {{{

"set spell
set spelllang=en_gb

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Code editing {{{

set expandtab softtabstop=4  " Pressing tab inserts 4 spaces
set shiftwidth=4    " Number of spaces used for auto-indent
set tabstop=8       " Any existing tabs look like 8 spaces (default)

set autoindent      " Copy indentation from previous line, unless...
filetype on         " Detect filetype
filetype plugin on  " Tweak editor behaviour based on filetype
filetype indent on  " And use file-specific indentation behaviour

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Folding {{{

set foldenable          " Turn on folds
set foldmethod=marker   " Fold based on three sets of curly braces
set foldlevelstart=0    " All folds closed to start with
set foldminlines=0      " Close all folds, even if single-line

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Searching {{{

set ignorecase  " Case-insensitive...
set smartcase   " ...except when the search string contains upper case

set hlsearch    " Highlight matches (clear highlights with `:noh[lsearch]`)
set incsearch   " Start matching while typing

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" }}}
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" Appearance {{{

" Options that are purely cosmetic.
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Editor appearance {{{

set showcmd     " Show partial commands in bottom right corner

set nowrap      " Long lines don't break

set cursorline  " Highlight current line
"set number     " Show line numbers
"set relativenumber

set showmatch   " Highlight matching brackets

" Highlight tabs and trailing whitespace
" https://vi.stackexchange.com/a/423
set list
set listchars=tab:├─,trail:·

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Colours! {{{

" http://vimcolors.com
" https://github.com/noah/vim256-color

syntax enable   " Turn on syntax highlighting

colorscheme lucius
" Lucius[Black|Dark|Light|White][HighContrast|LowContrast]
LuciusWhiteLowContrast

"colorscheme summerfruit256

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Statusline {{{

" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html

set laststatus=2             " Always show the status line
" Basic syntax: %-0{minwid}.{maxwid}{item}
set statusline=
set statusline+=\ %n)        " Buffer number
set statusline+=\ %.30f      " Path to file (truncated to 30 chars)
set statusline+=\ %y         " [filetype]
set statusline+=\ [          " [encoding, modifiable, read only]
set statusline+=%{(&fenc!=''?&fenc:&enc)}
set statusline+=%M
set statusline+=%R
set statusline+=]
set statusline+=%=           " Switch to right-hand side
set statusline+=%l/%L:%-2c\  " Current/total lines : column

" }}}
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" }}}
" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

" References
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" http://vim.wikia.com/wiki/Example_vimrc
" https://dougblack.io/words/a-good-vimrc.html
