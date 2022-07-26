--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"

vim.g.mapleader = ' '
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Optionslua
require('keys')      -- Keymaps
require('plug')      -- Plugins
require('custom')	 -- Plugin Settings


-- TODO: 
-- try git fugitive
-- build telescope plugin for docker containers

-- cmds
vim.cmd("colorscheme tokyodark")
