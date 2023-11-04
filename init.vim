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


call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
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

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

colorscheme catppuccin
