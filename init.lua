-- init.lua
-- Neovim-specific configuration
-- based on https://github.com/nicknisi/dotfiles

require("globals")
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local env = vim.env
local utils = require("utils")
local termcodes = utils.termcodes
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap
local xmap = utils.xmap
local omap = utils.omap

-- General
---------------------------------------------------------------------------------------------------
cmd [[syntax on]]
opt.mouse = "a" -- set mouse mode to all modes
opt.clipboard = "unnamedplus" -- MacOS clipboard unification

opt.number = true -- show line numbers
opt.showmode = true -- don't show which mode disabled for PowerLine
opt.autoread = true -- Reread file when only modified externaly

opt.cursorline = true
opt.scrolloff = 3 -- set 3 lines to the cursors - when moving vertical

opt.tabstop = 4 -- the visible width of tabs
opt.softtabstop = 4 -- edit as if the tabs are 4 characters wide
opt.shiftwidth = 4 -- number of spaces to use for indent and unindent
opt.expandtab = true -- show line numbers
-- opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
-- opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

opt.hlsearch = true -- highlight search results
opt.incsearch = true -- set incremental search, like modern browsers

-- toggle invisible characters
opt.list = true
opt.listchars = {
  tab = "  ",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}

-- timeout to sequence chars
opt.timeoutlen = 1000

-- Mappings
---------------------------------------------------------------------------------------------------
g.mapleader = ","
opt.pastetoggle = "<F2>"
vim.keymap.set("n", "<F3>", ":set number!<CR>")
-- Just a debugging
vim.keymap.set("n", "<leader>?", ":echo(\"<leader> works! It is set to <leader>\")<CR>")
-- insert lines
vim.keymap.set("n", "<C-j>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>")
vim.keymap.set("n", "<C-k>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>")
-- remove current search hightlight
vim.keymap.set("n", "<C-l>", ":noh<CR>")
---------------------------------------------------------------------------------------------------

require("plugins")
cmd [[colorscheme jelleybeans]]
