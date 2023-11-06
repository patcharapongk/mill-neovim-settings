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

Plug 'nvim-tree/nvim-web-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
Plug 'drewtempelmeyer/palenight.vim', { 'as': 'palenight' } 
Plug 'olimorris/onedarkpro.nvim', {'as': 'onedarkpro'}
Plug 'wojciechkepka/vim-github-dark'
Plug 'JoosepAlviste/palenightfall.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'
Plug 'webdevel/tabulous'

Plug 'github/copilot.vim'
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
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

colorscheme rose-pine-moon 
