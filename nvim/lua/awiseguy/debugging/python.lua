-- Python debug settings
local home = os.getenv('HOME')
local dap = require("dap")

require('dap-python').setup(home .. '/.venv/bin/python')

local pzhAttachDocker = {
	type = "python";
	request = "attach";
	connect = {
		port = 5679;
		host = "localhost";
	};
	mode = "remote";
	name = "PZH Attach Docker DAP";
	-- vim.fn.getcwd()
	cwd = home .. "/Documents/Omgevingsbeleid-API";
	pathMappings = {
		{
			localRoot = home .. "/Documents/Omgevingsbeleid-API";
			remoteRoot = "/code"; -- Wherever your Python code lives in the container.
		};
	};
}

local runFile = {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Python Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
}

-- table.insert(dap.configurations.python, pythonAttachConfig)
-- table.insert(dap.configurations.python, runPromptie)
--

dap.adapters.python = {
  type = 'executable';
  command = home .. '/.venv/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {runFile, pzhAttachDocker}

