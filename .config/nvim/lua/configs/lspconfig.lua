require("nvchad.configs.lspconfig").defaults()

-- Removed csharp_ls since it fails on macOS
local servers = { "gopls", "lua_ls", "jsonls", "pyright", "bashls" }

for _, lsp in ipairs(servers) do
  local cmd_map = {
    gopls = { "gopls" },
    lua_ls = { "lua-language-server" },
    jsonls = { "vscode-json-language-server", "--stdio" },
    pyright = { "pyright-langserver", "--stdio" },
    bashls = { "bash-language-server", "start" },
  }

  vim.lsp.config[lsp] = {
    cmd = cmd_map[lsp],
    on_attach = function(client, bufnr)
      local buf_map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- LSP keymaps
      buf_map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      buf_map("n", "K", vim.lsp.buf.hover, "Hover documentation")
      buf_map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      buf_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      buf_map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      buf_map("n", "gr", vim.lsp.buf.references, "Find references")
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }

  -- Check if the actual command executable exists
  local cmd_executable = cmd_map[lsp][1]
  if vim.fn.executable(cmd_executable) == 1 then
    vim.lsp.start(vim.lsp.config[lsp])
  else
    vim.notify("LSP server for " .. lsp .. " (" .. cmd_executable .. ") not found in PATH", vim.log.levels.WARN)
  end
end

-- Enable LSP servers dynamically when filetypes are opened
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "lua", "json", "python", "sh" },
  callback = function(args)
    local ft = args.match
    local lsp_map = {
      go = "gopls",
      lua = "lua_ls",
      json = "jsonls",
      python = "pyright",
      sh = "bashls",
    }
    local lsp = lsp_map[ft]
    if lsp and vim.lsp.config[lsp] then
      vim.lsp.start(vim.lsp.config[lsp])
    else
      vim.notify("No LSP configured for filetype: " .. ft, vim.log.levels.INFO)
    end
  end,
})
