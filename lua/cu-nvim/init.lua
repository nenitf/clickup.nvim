local curl = require("plenary.curl")
local default_config = require("cu-nvim.config")

local M = {
  config = default_config
}

local function autocmd()
  vim.api.nvim_create_user_command('CU', function()
      local env = M.config.env

      local statuses = ""
      for _, status in ipairs(env.default_filters.statuses) do
        statuses = statuses .. "&statuses[]=" .. status
      end
      statuses = string.gsub(statuses, "%s+", "%%20")

      local res = curl.get(
        "https://api.clickup.com/api/v2/team/" ..
        env.default_workspace ..
        "/task?order_by=created&reverse=true&assignees[]=" ..
        env.user_id ..
        "&space_ids[]=" ..
        env.default_space ..
        "&subtasks=true" .. statuses,
        {
          accept = "application/json",
          raw = { "-H", "Authorization: " .. env.api_token },
          timeout = 30000
        })

      local tickets = vim.fn.json_decode(res.body).tasks
      local qflist = {}
      for _, ticket in ipairs(tickets) do
        table.insert(qflist, { text = ticket.name, module = ticket.status.status, pattern = ticket.id })
      end

      vim.fn.setqflist({}, 'r', { title = 'Clickup', items = qflist })
      vim.api.nvim_command('cope')
    end,
    {}
  )
end

M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  autocmd()
end

return M
