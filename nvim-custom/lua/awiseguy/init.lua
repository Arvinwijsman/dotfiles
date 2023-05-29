--[[ init.lua ]]

-- LEADER
vim.g.mapleader = ' '
vim.g.localleader = "\\"

-- Base
require("awiseguy.vars")
require("awiseguy.opts")
require("awiseguy.plugins")
require("awiseguy.keys").general()

-- Custom plugin settings
require("awiseguy.telescope")
require("awiseguy.lsp")
require("awiseguy.plugins.settings")
-- require("awiseguy.terminal")

-- Debuggers
require("awiseguy.debugging")

-- cmds
vim.cmd("colorscheme tokyodark")
