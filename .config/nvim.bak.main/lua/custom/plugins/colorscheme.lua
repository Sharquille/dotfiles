return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      -- Import the Catppuccino setup function
      local catppuccin = require 'catppuccin'

      -- Setup Catppuccino
      catppuccin.setup {
        flavour = 'mocha',
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          notify = true,
        },
        -- ... (rest of your Catppuccino configuration)
      }

      -- Load the colorscheme
      vim.cmd [[colorscheme catppuccin]]

      -- Return the module
      return catppuccin
    end,
  },
}
