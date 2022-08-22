-- Custom DAP configurations
--
require('dap-python').setup('~/venv/debugpy/bin/python')

local pythonAttachConfig = {
	type = "python";
	request = "attach";
	connect = {
		port = 5679;
		host = "localhost";
	};
	mode = "remote";
	name = "PZH Attach Docker DAP";
	-- vim.fn.getcwd()
	cwd = "/home/arvin/Documents/pzh/Omgevingsbeleid-API";
	pathMappings = {
		{
			localRoot = "/home/arvin/Documents/pzh/Omgevingsbeleid-API";
			remoteRoot = "/code"; -- Wherever your Python code lives in the container.
		};
	};
}

table.insert(require('dap').configurations.python, pythonAttachConfig)

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 50, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	}
})

require("nvim-dap-virtual-text").setup {
	enabled = true,                        -- enable this plugin (the default)
	enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true,               -- show stop reason when stopped for exceptions
	commented = false,                     -- prefix virtual text with comment string
	only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
	all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
	filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
	-- experimental features:
	virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
}
