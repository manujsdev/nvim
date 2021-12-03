set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set termguicolors
set sw=2

" Use 256 colors in vim
" some plugins not work without it
set t_Co=256

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/plugins-config.vim
" so ~/.config/nvim/maps.vim

if (has("termguicolors"))
 set termguicolors
endif

set background=dark

colorscheme gruvbox

let g:gruvbox_contrast_dark = "hard"
highlight Normal ctermbg=NONE

set laststatus=2
set noshowmode

"" au BufNewFile,BufRead *.html set filetype=htmldjango
"" lua require'colorizer'.setup()

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
