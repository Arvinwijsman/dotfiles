local M = {}

M.attach_remote = function(host, port)
    local dap = require "dap"
	local port = tonumber(port)

    pythonAttachAdapter = {
        type = "server";
        host = host;
        port = port;
    }

    pythonAttachConfig = {
        type = "python";
        request = "attach";
        connect = {
            port = port;
            host = host;
        };
        mode = "remote";
        name = "Remote Attached Debugger";
        cwd = vim.fn.getcwd();
        pathMappings = {
            {
                localRoot = vim.fn.getcwd(); -- Wherever your Python code lives locally.
                remoteRoot = "/code"; -- Wherever your Python code lives in the container.
            };
        };
    }

    local session = dap.attach(host, port, pythonAttachConfig)

    if session == nil then
        io.write("Error launching adapter");
    end

    dap.repl.open()
end


M.testoutput = function(host, port)
	local port = tonumber(port)
	print("Connection args: ", host, port)
end

return M
