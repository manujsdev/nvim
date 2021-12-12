
hi Comment cterm=italic
let g:gruvbox_termcolors=256

syntax on
set background=dark
colorscheme gruvbox

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif