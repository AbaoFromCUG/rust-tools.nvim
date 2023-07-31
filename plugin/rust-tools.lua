vim.api.nvim_create_user_command("Cargo", require("rust-tools.commands").cargo, {})
