local nvimtree = require("nvim-tree")
local nvimtree_api = require("nvim-tree.api")

nvimtree.setup {
  open_on_tab = true,
  update_focused_file = {
    enable = true
  }
}

vim.keymap.set("n", "<leader>k", function() nvimtree_api.tree.toggle(false) end)
