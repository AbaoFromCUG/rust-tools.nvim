# Another rustaceans' tool for neovim

# Intergrate


## rust-analyzer

You can configuration rust-analyzer link vscode, full configurable regard to https://rust-analyzer.github.io/manual.html#configuration

`.vscode/settings.json`
```json
{
    "rust-analyzer.cargo.target": "wasm32-unknown-unknown"
}
```


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

