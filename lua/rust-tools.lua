---@class rust-tools.Config
---@field command? boolean Your config option
---@field lspconfig? boolean automatically setup rust-analyzer for settings

---@type rust-tools.Config
local default_config = {
  command = true,
  lspconfig = true,
}

local M = {}

---@param args? rust-tools.Config
function M.setup(args)
  args = args or {}
  M.config = vim.tbl_deep_extend("force", default_config, args or {})

  if M.config.lspconfig then
    local settings = require("integrator.settings")
    settings.on_setting_changed("rust-analyzer", function()
      print("rust-analyzer changed")
      local clients = vim.lsp.get_active_clients({ name = "rust_analyzer" })
      if #clients == 1 then
        print("found client")
        local client = clients[2]
        client.notify("workspace/didChangeConfiguration", {
          settings = require("integrator.settings").get_setting("rust-analyzer"),
        })
      end
    end)

    local lsputil = require("lspconfig").util
    lsputil.on_setup = lsputil.add_hook_before(lsputil.on_setup, function(config)
      if config.name == "rust_analyzer" then
        config.on_init = lsputil.add_hook_before(config.on_init, function(client)
          print("hook on_init")
          client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
            ["rust-analyzer"] = settings.get_setting("rust-analyzer"),
          })
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end)
      end
    end)
  end
end

return M
