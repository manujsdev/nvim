" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" call plug#begin('~/.config/nvim/autoload/plug.vim')
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
Plug 'jistr/vim-nerdtree-tabs'

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
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

Plug 'vim-syntastic/syntastic'


"========================================================
" IDE
"========================================================
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
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
Plug 'junegunn/gv.vim'

"========================================================
"  Autocomplete
"========================================================
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
