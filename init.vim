lua << EOF
require("config.lazy")
EOF

set number		"show line numbers
hi LineNr guibg=bg

set termguicolors	"use true color

set foldcolumn=2	"2 chars left

set colorcolumn=80 	"80 char limit
"highlight ColorColumn ctermbg=0 guibg=lightgrey "limit color
hi foldcolumn guibg=bg

set tabstop=4
set softtabstop=0
set shiftwidth=0
set expandtab		"use spaces
set autoindent		
filetype plugin indent on
autocmd FileType make setlocal noexpandtab "use TABS in Makefiles

hi EndOfBuffer guifg=bg guibg=bg
"hi VertSplit guibg=#302d38 guifg=#302d38

syntax enable		"keep current colors for :highlight, syntax on overrules

"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

let g:indentLine_color_gui = '#ea4c88'
let g:indentLine_char = '⏽ '


let mapleader=" "
map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>t :terminal<cr>:startinsert<cr>

"navigate windows with ALT+hjlk
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

"exit terminal mode with ESC
:tnoremap <Esc> <C-\><C-n>

