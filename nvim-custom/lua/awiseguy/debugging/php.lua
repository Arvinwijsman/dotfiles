-- PHP debug settings
--
local home = os.getenv('HOME')
local dap = require("dap")

-- local phpAttachConfig = {
-- 	type = "php";
-- 	request = "launch";
-- 	port = 9003;
-- 	name = "PHP launch xdebug";
-- 	cwd = vim.fn.getcwd();
-- }

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/arvinwijsman/Downloads/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Launch php XDEBUG',
    port = 9003
  }
}

-- table.insert(dap.configurations.php, phpAttachConfig)
