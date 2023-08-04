-- main module file
-- local module = require("plugin_name.module")

---@class rust-tools.Config
---@field command? boolean Your config option

---@type rust-tools.Config
local default_config = {
  command = true,
}

local M = {}

---@param args? rust-tools.Config
function M.setup(args)
  args = args or {}
  M.config = vim.tbl_deep_extend("force", default_config, args or {})

  if M.config.command then
  end
end

return M
