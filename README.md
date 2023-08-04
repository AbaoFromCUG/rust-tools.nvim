# Another rustaceans' tool for neovim

# Intergrate

## overseer.nvim
No need any config, simple add configuration to you `.vscode/tasks.json`

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "type": "cargo",
            "command": "build",
            "args": [
                "--package",
                "app"
            ],
            "label": "build desktop"
        }
    ]
}

```

## intergrater.nvim
- [ ] Support `${command:cargo.xxx}` command variables


