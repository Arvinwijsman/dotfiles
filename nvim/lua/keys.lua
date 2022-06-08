--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
-- map('i', 'jk', '', {})

-- Telescope
-- map(
--   "n",
--   "<space>.",
--   ":Telescope find_files<CR>",
--   { noremap = true, silent = true }
-- )

-- Telescope Browser
-- map(
--   "n",
--   "<space>p",
--   ":Telescope file_browser<CR>",
--   { noremap = true, silent = true }
-- )

-- nvim Tree
map(
  "n",
  "<space>op",
  ":NvimTreeToggle <CR>",
  { noremap = true, silent = true }
)
