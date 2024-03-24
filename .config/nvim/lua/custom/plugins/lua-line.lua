return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Import lualine module
      local lualine = require 'lualine'

      -- Set up lualine with custom options and configurations
      lualine.setup {
        options = {
          -- Enable icons
          icons_enabled = true,

          -- Use 'dracula' theme for lualine
          theme = 'dracula',

          -- Set separators for components and sections
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },

          -- Define disabled filetypes for statusline and winbar
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },

          -- Define filetypes to be ignored for focus tracking
          ignore_focus = {},

          -- Always divide the middle section
          always_divide_middle = true,

          -- Disable global statusline
          globalstatus = false,

          -- Set refresh intervals for different components
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },

        -- Define sections for the active statusline
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },

        -- Define sections for the inactive statusline
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },

        -- Define empty configurations for tabline, winbar, and inactive winbar
        tabline = {},
        winbar = {},
        inactive_winbar = {},

        -- No extensions added in this setup
        extensions = {},
      }

      return lualine
    end,
  },
}
