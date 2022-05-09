local nvimtree = require("nvim-tree")

nvimtree.setup {
  auto_close = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true
  }
}

vim.keymap.set("n", "<leader>k", function() nvimtree.toggle(false) end)
