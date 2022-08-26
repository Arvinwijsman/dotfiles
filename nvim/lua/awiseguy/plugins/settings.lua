-- Plugin settings overwrites

-- Tree shitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
		"python", 
		"php", 
		"lua", 
		"json", 
		"dockerfile", 
		"markdown", 
		"typescript", 
		"yaml"
	},

    highlight = { -- enable highlighting for all file types
      enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
    },
    incremental_selection = {
      enable = true,
      keymaps = {                       -- mappings for incremental selection (visual mappings)
        init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
        node_incremental = "grn",       -- increment to the upper named parent
        scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
        node_decremental = "grm",       -- decrement to the previous node
      }
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@statement.inner",
        },
      },
    },
}

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
		{
			'filename',
			path = 1
		}
	},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Project manager
require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "docker-compose.yml" },
  ignore_lsp = {},
  exclude_dirs = {},
  show_hidden = true,
  silent_chdir = true,
  datapath = vim.fn.stdpath("data"),
}


-- Nvim-tree
require("nvim-tree").setup({
  respect_buf_cwd = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})
require("awiseguy.keys").nvimtree()


-- Org mode
require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/Documents/org/**/*'},
  org_default_notes_file = '~/Documents/org/notes.org',
})
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, 
  },
  ensure_installed = {'org'}, 
}

