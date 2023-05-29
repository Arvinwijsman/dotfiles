-- Extra telescope functions
--

local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

local m = {}

function m.delete_buffer_button()
  -- Hook button to delete buffer in telescope pickers
  require('telescope.builtin').buffers{
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_current_selection()
        actions.close(prompt_bufnr)
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end
      map('n', 'd', delete_buf)
    end
  }

end

return m
