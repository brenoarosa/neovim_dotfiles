local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")

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
    -- =================================== PYTHON ==================================================
    -- overwrite commands to call via `python -m <CMD>`
    -- This enables PDM PEP582 implementation that sets PYTHONPATH but don't changes PATH
    -- most binaries that would be installed on a venv should work with `python -m`

    -- requires black 21.4b0+
    null_ls.builtins.formatting.black.with({
      command = "python",
      args = { "-m", "black", "--stdin-filename", "$FILENAME", "--quiet", "-", }, }),
    null_ls.builtins.diagnostics.pylint.with({
      command = "python",
      args = { "-m", "pylint", "--from-stdin", "$FILENAME", "-f", "json" },

    }),
    null_ls.builtins.diagnostics.mypy.with({
      command = "python",
      args = function(params)
          return {
            "-m",
            "mypy",
            "--hide-error-codes",
            "--hide-error-context",
            "--no-color-output",
            "--show-column-numbers",
            "--show-error-codes",
            "--no-error-summary",
            "--no-pretty",
            "--shadow-file",
            params.bufname,
            params.temp_path,
            params.bufname,
        }
      end,
    }),

    -- =================================== GOLANG ==================================================
    null_ls.builtins.formatting.gofmt,
  },
})

-- Toggle diagnostics helper
vim.diagnostic.disable()
vim.g.diagnostics_active = false
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

vim.keymap.set("n", "<leader>c", toggle_diagnostics)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
