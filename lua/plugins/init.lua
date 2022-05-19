local utils = require("utils")

local plugBegin = vim.fn["plug#begin"]
local plugEnd = vim.fn["plug#end"]

plugBegin("~/.config/nvim/plugged")
-- NOTE: the argument passed to Plug has to be wrapped with single-quotes

-- mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
vim.cmd [[Plug 'tpope/vim-surround']]

-- enables repeating other supported plugins with the . command
vim.cmd [[Plug 'tpope/vim-repeat']]

-- editorconfig
vim.cmd [[Plug 'editorconfig/editorconfig-vim']]

-- git plugin
vim.cmd [[Plug 'airblade/vim-gitgutter']]

-- return to last cursor position when reopenning files
vim.cmd [[Plug 'farmergreg/vim-lastplace']]

-- Easy comment and uncoment
vim.cmd [[Plug 'terrortylor/nvim-comment']]

-- airline plugin
vim.cmd [[Plug 'vim-airline/vim-airline']]

-- colorscheme
vim.cmd [[Plug 'flazz/vim-colorschemes']]

-- icons
vim.cmd [[Plug 'kyazdani42/nvim-web-devicons']]

-- telescope file finder / preview
vim.cmd [[Plug 'nvim-lua/plenary.nvim']]
vim.cmd [[Plug 'nvim-telescope/telescope.nvim']]
vim.cmd [[Plug 'nvim-telescope/telescope-fzy-native.nvim']]

-- file navigator
vim.cmd [[Plug 'kyazdani42/nvim-tree.lua']]

-- LSP
vim.cmd [[Plug 'neovim/nvim-lspconfig']]

-- Adds LSP functionality to non-language servers: like linters and formatters
vim.cmd [[Plug 'jose-elias-alvarez/null-ls.nvim']]

plugEnd()

require('nvim_comment').setup()

vim.g.airline_powerline_fonts = true
vim.g["airline#extensions#tabline#enabled"] = true
vim.g["airline#extensions#tabline#show_buffers"] = false
vim.g["airline#extensions#tabline#tab_nr_type"] = 1 -- tab number

local telescope_builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags)

require("telescope").load_extension("fzy_native")
require("plugins.nvimtree")
require("plugins.lsp")
