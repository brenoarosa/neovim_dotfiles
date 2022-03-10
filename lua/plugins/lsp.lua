local nvim_lsp = require("lspconfig")

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
