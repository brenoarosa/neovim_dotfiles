local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local utils = require("utils")
local nmap = utils.nmap
local nnoremap = utils.nnoremap

local plugBegin = fn["plug#begin"]
local plugEnd = fn["plug#end"]

plugBegin("~/.config/nvim/plugged")
-- NOTE: the argument passed to Plug has to be wrapped with single-quotes

-- mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
cmd [[Plug 'tpope/vim-surround']]

-- enables repeating other supported plugins with the . command
cmd [[Plug 'tpope/vim-repeat']]

-- editorconfig
cmd [[Plug 'editorconfig/editorconfig-vim']]

-- airline plugin
cmd [[Plug 'vim-airline/vim-airline']]

-- colorscheme
cmd [[Plug 'flazz/vim-colorschemes']]

-- icons
cmd [[Plug 'kyazdani42/nvim-web-devicons']]

-- telescope file finder / preview
cmd [[Plug 'nvim-lua/plenary.nvim']]
cmd [[Plug 'nvim-telescope/telescope.nvim']]
cmd [[Plug 'nvim-telescope/telescope-fzy-native.nvim']]

-- file navigator
cmd [[Plug 'kyazdani42/nvim-tree.lua']]

-- git plugin
cmd [[Plug 'airblade/vim-gitgutter']]

plugEnd()

g.airline_powerline_fonts = true
g["airline#extensions#tabline#enabled"] = true
g["airline#extensions#tabline#show_buffers"] = false
g["airline#extensions#tabline#tab_nr_type"] = 1 -- tab number

nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

require("plugins.nvimtree")
