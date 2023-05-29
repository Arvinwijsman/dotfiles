local terminal = require("toggleterm.terminal")

local terms = {}

-- Custom terminal presets
local default = terminal.Terminal:new({ 
})

local float = terminal.Terminal:new({ 
    direction = 'float'
})

-- Toggle functions
function terms.toggle()
    default:toggle()  
end

function terms.toggle_float()
    float:toggle()  
end

return terms
