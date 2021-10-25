local nnoremap = require("utils").nnoremap
local nvimtree = require("nvim-tree")
local view = require("nvim-tree.view")

_G.NvimTreeConfig = {}

function NvimTreeConfig.find_toggle()
  if view.win_open() then
    view.close()
  else
    vim.cmd("NvimTreeFindFile")
  end
end

nnoremap("<leader>k", "<CMD>lua NvimTreeConfig.find_toggle()<CR>")

nvimtree.setup()
