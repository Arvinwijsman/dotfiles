-- Python debug settings
--
local home = os.getenv('HOME')
local dap = require("dap")

require('dap-python').setup(home .. '/venv/debugpy/bin/python')

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
	cwd = home .. "/Documents/pzh/Omgevingsbeleid-API";
	pathMappings = {
		{
			localRoot = home .. "/Documents/pzh/Omgevingsbeleid-API";
			remoteRoot = "/code"; -- Wherever your Python code lives in the container.
		};
	};
}

table.insert(dap.configurations.python, pythonAttachConfig)
