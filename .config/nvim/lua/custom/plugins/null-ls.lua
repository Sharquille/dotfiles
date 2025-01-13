return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  lazy = true,
  dependencies = {
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    local mason_null_ls = require 'mason-null-ls'
    local null_ls = require 'null-ls'
    local null_ls_utils = require 'null-ls.utils'
    mason_null_ls.setup {
      ensure_installed = {
        'black',
        'mypy',
        'pyright',
        'gopls',
        'golines',
        'gofumpt',
        'goimports-reviser',
        'delve',
        'biome',
      },
    }

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    -- configure null_ls
    null_ls.setup {
      root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),

      sources = {
        formatting.prettier.with {
          extra_filetypes = { 'svelte' },
        },
        -- python sources
        formatting.black,
        diagnostics.mypy,
        -- lua sources
        formatting.stylua,
        -- go sources
        formatting.gofumpt,
        formatting.golines,
        -- typescript
        formatting.biome,
        diagnostics.tsserver,
        -- Markdown
        formatting.markdownlint,
        diagnostics.markdownlint,
      },

      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}
