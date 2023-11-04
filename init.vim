set nocompatible            " disable compatibility to old-time vi
set mouse=a
set number
set ttyfast
set hlsearch
set showmatch
set cursorline
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set nuw=4
set numberwidth=5

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

lua << EOF
require'nvim-tree'.setup { view={side="right"} }
require('lualine').setup({
  sections = {
    lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
  },
})
EOF


cnoremap <expr> <Up>   getcmdtype() ==# ':' && getcmdpos() == 1 ? '<Up>'   : "\<C-p>"
cnoremap <expr> <Down> getcmdtype() ==# ':' && getcmdpos() == 1 ? '<Down>' : "\<C-n>"
nnoremap <C-l> :NvimTreeFindFile<CR>
nnoremap <C-e> :NvimTreeToggle <CR>

colorscheme catppuccin
