-- init.lua
-- Neovim-specific configuration
-- based on https://github.com/nicknisi/dotfiles

require("globals")
local utils = require("utils")
local termcodes = utils.termcodes

-- General
---------------------------------------------------------------------------------------------------
vim.cmd [[syntax on]]
vim.opt.mouse = "a" -- set mouse mode to all modes

-- install wl-clipboard on Wayland
-- install xclip on X11
-- MacOS clipboard OK
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true -- show line numbers
vim.opt.showmode = true -- don't show which mode disabled for PowerLine
vim.opt.autoread = true -- Reread file when only modified externaly

vim.opt.cursorline = true
vim.opt.scrolloff = 3 -- set 3 lines to the cursors - when moving vertical

vim.opt.tabstop = 4 -- the visible width of tabs
vim.opt.softtabstop = 4 -- edit as if the tabs are 4 characters wide
vim.opt.shiftwidth = 4 -- number of spaces to use for indent and unindent
vim.opt.expandtab = true -- show line numbers
-- vim.opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
-- vim.opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- set incremental search, like modern browsers

-- toggle invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "  ",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}

-- timeout to sequence chars
vim.opt.timeoutlen = 1000

-- Mappings
---------------------------------------------------------------------------------------------------
vim.g.mapleader = ","
vim.opt.pastetoggle = "<F2>"
vim.keymap.set("n", "<F3>", function() vim.opt.number = (not vim.opt.number:get()) end)
-- Just a debugging
vim.keymap.set("n", "<leader>?", ":echo(\"<leader> works! It is set to <leader>\")<CR>")
-- insert lines
vim.keymap.set("n", "<C-j>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>")
vim.keymap.set("n", "<C-k>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>")
-- remove current search hightlight
vim.keymap.set("n", "<C-l>", ":noh<CR>")
---------------------------------------------------------------------------------------------------

require("plugins")
vim.cmd [[colorscheme jelleybeans]]
