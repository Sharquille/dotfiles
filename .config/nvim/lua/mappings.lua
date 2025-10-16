require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Make 'i' enter insert mode and 'ii' return to normal mode
map("n", "i", "i", { desc = "Enter insert mode" })
map("i", "ii", "<Esc>", { desc = "Exit insert mode" })

-- Toggle NvimTree with <leader>e (open/close)
map("n", "<leader>e", function()
  local api = require("nvim-tree.api")
  if api.tree.is_visible() then
    api.tree.close()
  else
    api.tree.open()
  end
end, { desc = "Toggle NvimTree" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
