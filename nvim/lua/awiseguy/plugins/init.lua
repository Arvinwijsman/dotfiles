-- install if first run
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	-- Base deps
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'rstacruz/vim-closer'
	use 'kyazdani42/nvim-web-devicons'
	
	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	
    -- Theming 
	use {'Mofiqul/dracula.nvim', as = 'dracula-nvim'}
    use {'navarasu/onedark.nvim', as = 'one-dark'}
	use {'tiagovla/tokyodark.nvim'}
  
    -- Status line 
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
  
	-- Tree shitter  
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescope Furry Finders  
    use {
		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} }
    }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		"ahmedkhalf/project.nvim",
		requires = { 'nvim-telescope/telescope.nvim' }
	}	

	-- Debugging --
	use { 'mfussenegger/nvim-dap' }
	use { 'mfussenegger/nvim-dap-python' }
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use { 'theHamsta/nvim-dap-virtual-text' }

	-- File Explorer tree
	use {
		'kyazdani42/nvim-tree.lua',
    	requires = {
    	  'kyazdani42/nvim-web-devicons', -- optional, for file icon
    	},
    	tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

    -- Terminals
    use { "akinsho/toggleterm.nvim", tag = '*' }

	-- Misc
	use { "preservim/tagbar" }
	use { 'tpope/vim-commentary' }
	use { 'tpope/vim-surround' }
    -- use { 'tpope/vim-dispatch' }
    use { 'mhartington/formatter.nvim' }

    -- Python
    use { 'vim-scripts/indentpython.vim' }


    --use {
    --  'nvim-orgmode/orgmode',
    --  requires = { 'nvim-treesitter/nvim-treesitter', opt = true }
    --}
end)


