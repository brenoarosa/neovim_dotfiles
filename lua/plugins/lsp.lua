local g = vim.g
local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")
local nnoremap = require("utils").nnoremap

-- Jedi
nvim_lsp.jedi_language_server.setup {
  root_dir = function(fname)
      local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
      }
      return nvim_lsp.util.root_pattern(unpack(root_files))(fname) or nvim_lsp.util.find_git_ancestor(fname) or vim.fn.getcwd()
    end;
}

-- null-ls
-- check sources at: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
null_ls.setup({
  debug = false,
  sources = {
    null_ls.builtins.formatting.black, -- requires black 21.4b0+
    null_ls.builtins.diagnostics.pylint,
    -- null_ls.builtins.diagnostics.mypy, -- not working for some unknow reason
  },
})

-- Toggle diagnostics helper
vim.diagnostic.disable()
g.diagnostics_active = false
function _G.toggle_diagnostics()
  if g.diagnostics_active then
    g.diagnostics_active = false
    vim.diagnostic.disable()
  else
    g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

nnoremap("<leader>c", "<cmd>lua toggle_diagnostics()<CR>")
nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
