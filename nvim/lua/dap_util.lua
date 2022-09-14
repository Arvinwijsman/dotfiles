local M = {}

local dap =  require'dap'

M.attach_docker_debugger = function(args)
    local dap = require "dap"
    --local host = args[1] 
    local host = "127.0.0.1"
    local port = 5679;
	local remotePath = "/code";

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
                remoteRoot = remotePath
            };
        };
    }
    local session = dap.attach(host, port, pythonAttachConfig)
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open()
end

function M.reload_dap_conf()
  package.loaded['debug'] = nil
  require('debug')
  io.write("DAP config in debug.lua reloaded...");
end

return M
