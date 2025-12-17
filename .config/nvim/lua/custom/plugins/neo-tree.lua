return {
  {

    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      local g = vim.g

      -- Use NerdTree Icons
      g.icons_enabled = 1
      g.webdevicons_enable = 1

      -- set neotree width
      g.neo_tree_width = 30

      -- enable file icons
      g.neotree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
      }

      -- Set the default ignored files and folders
      g.neotree_ignore = { '.git', '.svn', '.hg', '.DS_Store' }

      -- Customize the NerdTree theme (you can choose a theme of your liking)
      g.neotree_theme = 'nerdtree'

      -- Key mapping to toggle NeoTree
      vim.api.nvim_set_keymap('n', '<Space>e', ':Neotree filesystem reveal left<CR>', { noremap = true })

      -- vim.cmd([[autocmd BufWritePost * if isdirectory(getcwd()) | execute("NeoTreeRefresh") | endif]])"
    end,
  },
}
