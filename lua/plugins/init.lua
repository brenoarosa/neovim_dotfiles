local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local utils = require("utils")
local nmap = utils.nmap

local plugBegin = fn["plug#begin"]
local plugEnd = fn["plug#end"]

plugBegin("~/.config/nvim/plugged")

-- NOTE: the argument passed to Plug has to be wrapped with single-quotes

-- mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
cmd [[Plug 'tpope/vim-surround']]

-- enables repeating other supported plugins with the . command
cmd [[Plug 'tpope/vim-repeat']]

-- airline plugin
cmd [[Plug 'vim-airline/vim-airline']]

-- colorscheme
cmd [[Plug 'flazz/vim-colorschemes']]

-- telescope file finder / preview
cmd [[Plug 'nvim-lua/plenary.nvim']]
cmd [[Plug 'nvim-telescope/telescope.nvim']]
cmd [[Plug 'nvim-telescope/telescope-fzy-native.nvim']]

-- fugitive
-- cmd [[Plug 'tpope/vim-fugitive']]
-- cmd [[Plug 'tpope/vim-rhubarb']]
-- nmap("<leader>gr", ":Gread<cr>")
-- nmap("<leader>gb", ":G blame<cr>")

-- cmd("Plug 'tpope/vim-markdown', { 'for': 'markdown' }")
-- g.markdown_fenced_languages = {tsx = "typescript.tsx"}

plugEnd()

g.airline_powerline_fonts = true
g["airline#extensions#tabline#enabled"] = true

-- require("plugins.nvimtree")
