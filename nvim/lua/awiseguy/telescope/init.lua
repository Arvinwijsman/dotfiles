-- Telescope
local telescope = require("telescope")

telescope.setup{
  defaults = {
    mappings = {
      i = { }
    },
	file_ignore_patterns = { "node_modules", ".git" }
  },
  pickers = { },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        ["i"] = { },
        ["n"] = { },
      },
    },
  },
}

--require("telescope").load_extension 'file_browser'
telescope.load_extension("fzf")
telescope.load_extension("projects")

-- Keymappings from file
require("awiseguy.keys").telescope()

-- Extra functions
-- require("awiseguy.telescope.extra").delete_buffer_button()
