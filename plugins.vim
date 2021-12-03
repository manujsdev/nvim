call plug#begin('~/.vim/plugged')

"========================================================
"  Themes
"========================================================

Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

"========================================================
"  Tree
"========================================================

" Great file system explorer, it appears when you open dir in vim
Plug 'scrooloose/nerdtree'

"========================================================
"  HTML
"========================================================

" Automatically add closing tags in html-like formats
Plug 'alvan/vim-closetag'

"========================================================
"  Typings
"========================================================

Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

"========================================================
"  Dev
"========================================================
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

Plug 'vim-syntastic/syntastic'


"========================================================
" IDE
"========================================================
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'

"========================================================
"  Status bar
"========================================================
" Nice statusline/ruler for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"========================================================
"  Git
"========================================================
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"========================================================
"  Autocomplete
"========================================================
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
