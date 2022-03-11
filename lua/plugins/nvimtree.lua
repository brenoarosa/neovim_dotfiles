local nnoremap = require("utils").nnoremap
local nvimtree = require("nvim-tree")

nvimtree.setup {
  auto_close = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true
  }
}

nnoremap("<leader>k", ":NvimTreeToggle<CR>")
