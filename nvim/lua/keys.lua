--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
-- map('i', 'jk', '', {})

-- nvim Tree
map(
  "n",
  "<space>op",
  ":NvimTreeToggle <CR>",
  { noremap = true, silent = true }
)

map(
  "n",
  "<space>or",
  ":NvimTreeRefresh <CR>",
  { noremap = true, silent = true }
)

-- Close buffer but keep window open
map(
  "n",
  "<space>bq",
  ":bp<bar>sp<bar>bn<bar>bd<CR>",
  { noremap = true, silent = true }
)

-- TELESCOPE

-- -- Show and switch buffers
vim.keymap.set('n', '<leader><TAB>', require('telescope.builtin').buffers)

-- local action_state = require('telescope.actions.state')
-- local actions = require('telescope.actions')
-- 
-- local m = {}
-- m.my_buffer = function()
--   require('telescope.builtin').buffers{
--     attach_mappings = function(prompt_bufnr, map)
--       local delete_buf = function()
--         local selection = action_state.get_current_selection()
--         actions.close(prompt_bufnr)
--         vim.api.nvim_buf_delete(selection.bufnr, { force = true })
--       end
--       map('n', 'd', delete_buf)
--     end
--   }
-- end

-- -- File opening
vim.keymap.set('n', '<leader>sp', require('telescope').extensions.projects.projects)
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').find_files({ 
	  previewer = false,
	  hidden = true
  })
end)

-- -- Fuzzy finding
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sF', require('telescope.builtin').live_grep)


-- -- Git pickers
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').git_branches)
vim.keymap.set('n', '<leader>sL', require('telescope.builtin').git_commits)
vim.keymap.set('n', '<leader>sl', require('telescope.builtin').git_bcommits)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').git_status)

-- -- LSP pickers
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').lsp_references)
vim.keymap.set('n', '<leader>gd', require('telescope.builtin').lsp_definitions)
vim.keymap.set('n', '<leader>gi', require('telescope.builtin').lsp_implementations)

-- -- Other Utils
vim.keymap.set('n', '<leader>rg', require('telescope.builtin').registers)


-- LSPs
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- Keymaps on every LSP attach
local keys = {}

function keys.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>F', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<space>oi', ":PyrightOrganizeImports<CR>", bufopts)
end


-- Debugger --
vim.keymap.set('n', '<space>dt', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<space>dc', ":lua require'dap.breakpoints'.clear()<CR>")

vim.keymap.set('n', '<space>db', ":lua require'dap'.continue()<CR>") 
vim.keymap.set('n', '<space>dq', ":lua require'dap'.terminate()<CR>") 
vim.keymap.set('n', '<space>do', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<space>dj', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<space>dk', ":lua require'dap'.step_out()<CR>")

-- extra F key maps
vim.keymap.set('n', '<F8>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F6>', ":lua require'dap'.terminate()<CR>") 
vim.keymap.set('n', '<F9>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F7>', ":lua require'dap'.step_out()<CR>")

-- misc
vim.keymap.set('n', '<space>dr', ":lua require'dap'.repl.open()<CR>") -- REPL
vim.keymap.set('n', '<space>dR', ":lua require'dap'.repl.close()<CR>") -- REPL
vim.keymap.set('n', '<space>du', ":lua require'dapui'.toggle()<CR>") -- toggle UI


return keys
