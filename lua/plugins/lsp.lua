local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")

-- Toggle diagnostics helper
vim.diagnostic.enable(false)
vim.g.diagnostics_active = false
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

-- copied from: https://github.com/neovim/nvim-lspconfig/tree/c5505c70571b094663745167d40388edd40f6450#suggested-configuration
-- changed <space> for <leader>

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<learder>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- remove since don't know how works
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- my custom maps
    vim.keymap.set("n", "<leader>c", toggle_diagnostics)
  end,
})


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

