--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"

vim.g.mapleader = ' '
vim.g.localleader = "\\"

-- IMPORTS
require('vars')			-- Variables
require('opts')      	-- Options
require('plug')      	-- Plugins
require('custom')		-- Plugin Settings
require('dap-settings')	-- DAP debugger settings
require('dap-docker')	-- DAP custom docker connect
require('keys')			-- Keymaps


-- cmds
vim.cmd("colorscheme tokyodark")
