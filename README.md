# Neovim Config
This is a breakdown of the Neovim configuration, including all plugins,
their features, and any associated keybindings. The setup uses 
Lazy.nvim for plugin management.

# Plugins

## Theme 

Plugin: [catppuccin/nvim](https://github.com/catppuccin/nvim)

Description: Provides a beautiful and customizable Neovim theme.

## Code Comments

### Comment.nvim

Plugin: [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

Purpose: Easily comment and uncomment lines or blocks of code.

Keybindings: None explicitly configured.

### Comment-Box

Plugin: [LudoPinelli/comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim)

Purpose: Create stylish comment boxes and lines.

Keybindings:
- <leader>cb: Create a left-aligned box.
- <leader>cc: Create a centered box.
- <leader>ct: Create a left-aligned titled line.
- <leader>cl: Create a centered line.
- <leader>cd: Remove a box or line.

# TODO
- [ ] Function signatures
- [ ] Use Vim motions with NeoTree (open/collapse directories/files)
- [ ] Avante
- [ ] Clean which-keys (create a directory with files for specific key bindings)
- [ ] Setup an "Extras" directory, where we can put things like Avante (for if we open source this)
    - [ ] Look through Christian's Lunar Vim setup for ideas
- [ ] File tabs and keymap to quickly jump back and forth between buffers (Cybu)
- [ ] Multi-cursor support (vim-visual-multi)
- [ ] Setup flash.nvim/sneak.nvim for quickly navigating files
