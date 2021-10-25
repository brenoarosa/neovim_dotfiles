local nnoremap = require("utils").nnoremap
local nvimtree = require("nvim-tree")

nnoremap("<leader>k", ":NvimTreeToggle<CR>")

nvimtree.setup {
  auto_close = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true
  }
}
