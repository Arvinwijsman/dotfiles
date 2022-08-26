--[[ keys.lua ]]
local keys = {}
local opts = { noremap=true, silent=true }
local set = vim.keymap.set
local map = vim.api.nvim_set_keymap


function keys.general()
	-- Close buffer but keep window open
	map("n","<space>bq",":bp<bar>sp<bar>bn<bar>bd<CR>",opts)
end

function keys.nvimtree()
	map("n","<space>op",":NvimTreeToggle <CR>",opts)
	map("n","<space>or",":NvimTreeRefresh <CR>",opts)
end

function keys.telescope()
	local telescope = require("telescope.builtin")
	-- -- Show and switch buffers
	set('n', '<leader><TAB>', telescope.buffers)

	-- -- File opening
	set('n', '<leader>sp', require('telescope').extensions.projects.projects)
	set('n', '<leader><space>', telescope.oldfiles)
	set('n', '<leader>so', function()
	  telescope.find_files({ 
		  previewer = false,
		  hidden = true
	  })
	end)

	-- -- Fuzzy finding
	set('n', '<leader>sf', telescope.current_buffer_fuzzy_find)
	set('n', '<leader>sF', telescope.live_grep)


	-- -- Git pickers
	set('n', '<leader>sb', telescope.git_branches)
	set('n', '<leader>sL', telescope.git_commits)
	set('n', '<leader>sl', telescope.git_bcommits)
	set('n', '<leader>st', telescope.git_status)

	-- -- LSP pickers
	set('n', '<leader>sr', telescope.lsp_references)
	set('n', '<leader>gd', telescope.lsp_definitions)
	set('n', '<leader>gi', telescope.lsp_implementations)

	-- -- Other Utils
	set('n', '<leader>rg', telescope.registers)
end

function keys.lsp_general()
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	set('n', '<space>e', vim.diagnostic.open_float, opts)
	set('n', '[d', vim.diagnostic.goto_prev, opts)
	set('n', ']d', vim.diagnostic.goto_next, opts)
	set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

-- Keymaps on every LSP attach
function keys.on_lsp_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  set('n', 'gd', vim.lsp.buf.definition, bufopts)
  set('n', 'K', vim.lsp.buf.hover, bufopts)
  set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  set('n', 'gr', vim.lsp.buf.references, bufopts)
  set('n', '<space>F', vim.lsp.buf.formatting, bufopts)
  set('n', '<space>oi', ":PyrightOrganizeImports<CR>", bufopts)
end


function keys.debugger()
	local dap = require("dap");
	local dapui = require("dapui");
	local dapbp = require("dap.breakpoints");

	set('n', '<space>dt', dap.toggle_breakpoint)
	set('n', '<space>dT', dap.set_breakpoint)
	set('n', '<space>dc', dapbp.clear)

	set('n', '<space>dq', dap.terminate) 
	set('n', '<space>db', dap.continue)
	set('n', '<Up>', dap.continue)
	set('n', '<Down>', dap.step_over)
	set('n', '<Right>', dap.step_into)
	set('n', '<Left>', dap.step_out)

	-- extra F key maps
	set('n', '<F5>', dap.continue)
	set('n', '<F6>', dap.terminate)

	-- misc
	set('n', '<space>dr', dap.repl.open)
	set('n', '<space>dR', dap.repl.close)
	set('n', '<space>du', dapui.toggle)
end


return keys
