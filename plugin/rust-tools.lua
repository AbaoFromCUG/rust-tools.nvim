local rust = require("rust-tools")
vim.api.nvim_create_user_command("Rust", function(command)
  local subcommand = command.fargs[1]
  -- cmake.project[subcommand](cmake.project)
end, {
  complete = function(lead, cmdline, pos)
    print(vim.inspect(lead))
    return { "target" }
  end,
  nargs = "*",
  bang = true,
  desc = "CMake command",
})
